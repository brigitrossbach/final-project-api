class HomepagePhotosSerializer < ActiveModel::Serializer
  attributes :id, :tags, :url, :user_id, :username, :caption

  def username
    object.user.username
  end
end
