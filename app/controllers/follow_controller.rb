class FollowController < ApplicationController

  def create
    following_user = User.find(decoded_token[0]['user_id'])
    user = User.find(params[:followed_user][:id])
    following_user.follow(user)
    render json: {user: user, followers: user.followers, following: user.all_following}
  end

  def destroy
    unfollowing_user = User.find(decoded_token[0]['user_id'])
    user = User.find(params[:user_to_unfollow][:id])
    unfollowing_user.stop_following(user)
    render json: {user: user, followers: user.followers, following: user.all_following}
  end

end
