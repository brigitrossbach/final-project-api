class LikesController < ApplicationController

  def create
    user = User.find(decoded_token[0]['user_id'])
    photo = Photo.find(params[:photo_id])
    like = Like.create(user_id: user.id, photo_id: photo.id)
    render json: photo
  end

  def destroy
    like = Like.find(params[:id])
    photo = like.photo
    photos= Photo.all
    like.destroy
    render json: photo
  end
end
