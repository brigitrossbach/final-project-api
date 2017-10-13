class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :caption, :user_id, :username, :tags

  def username
    object.user.username
  end

end
