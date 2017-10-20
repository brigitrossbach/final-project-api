class UsersController < ApplicationController

  def index
    if decoded_token && decoded_token[0]['user_id'] != nil
      user = User.find(decoded_token[0]['user_id'])
    else
      user = User.all
    end
    render json: user
  end

  def show
    @user = User.find_by(username: params[:username])
    render json: @user
  end

  def create
    user = User.new(user_params)
    byebug
    if user.save
      token=encode_token({user_id: user.id})
    render json: {user: user, jwt: token}
  else
  end
  end

  def destroy
    user = User.find(params[:id])
    render json: {}
  end

private

def user_params
  params.permit(:username, :password, :first_name, :last_name, :email)
end

def include_hash
  {
    :include => [:photos => {:include => [:tags]}]
  }
end

def include_tags
  {
    :include => [:tags]
  }
end


end
