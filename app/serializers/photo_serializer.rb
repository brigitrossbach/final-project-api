class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :caption, :user_id, :username, :tags, :likes_count

  has_many :comments
  has_many :likes


  def username
    object.user.username
  end

  def likes_count
    object.likes.count
  end

end
