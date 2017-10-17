class LikesController < ApplicationController

  def create
    user = User.find(decoded_token[0]['user_id'])
    photo = Photo.find(params[:photo_id])
    like = Like.create(user_id: user.id, photo_id: photo.id)
    photos = Photo.all
    render json: photos
  end

  def destroy
    like = Like.find(params[:id])
    photos= Photo.all
    like.destroy
    render json: photos
  end
end
