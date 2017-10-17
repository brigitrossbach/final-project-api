class CommentsController < ApplicationController

  def create
      user = User.find(decoded_token[0]['user_id'])
      photo = Photo.find(params[:photoId])
      photos = Photo.all
      comment = Comment.new(comment: params[:comment], photo_id: photo.id, user_id: user.id)
    comment.save
    render json: photos
  end



end
