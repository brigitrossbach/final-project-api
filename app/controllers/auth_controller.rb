class AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      render json: {user: user, jwt: token}
    else
      render json: {error: 'User not found'}
    end
  end

end
