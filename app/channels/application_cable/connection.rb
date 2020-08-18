module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
 
    def connect
      self.current_user = find_verified_user
    end
 
    private

    def signing_secret
      ENV['JWT_SECRET_KEY']
    end
    
    def decoded_token
      token = request.params['token']
      begin
        JWT.decode(token, signing_secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
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
