class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :photo_id, :username

  def username
    object.user.username
  end

end
