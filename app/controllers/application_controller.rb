class ApplicationController < ActionController::API
  before_action :authorized
  
  def auth_header
    request.headers['Authorization']
  end
  
  def signing_secret
    ENV['JWT_SECRET_KEY']
  end
  
  def encode_token(user_id_hash)
    JWT.encode(user_id_hash, signing_secret)
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

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      user = User.find(user_id)
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end


  def authorized
    droids = 'These aren\'t the droids you\'re looking for.'
    render json: {message: droids}, status: :unauthorized unless logged_in?
  end

end
