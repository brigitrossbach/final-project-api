class CommentSerializer < ActiveModel::Serializer
  attributes :comment, :photo_id, :username

  def username
    object.user.username
  end
  
end
