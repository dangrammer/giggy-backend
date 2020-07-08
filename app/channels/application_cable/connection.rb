module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
 
    def connect
      # byebug
      self.current_user = find_verified_user
    end
 
    private

    def auth_header
      request.headers['Authorization']
    end
    
    def signing_secret
      ENV['JWT_SECRET_KEY']
    end
    
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, signing_secret, true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def find_verified_user
      if verified_user = User.find(decoded_token[0]['user_id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
