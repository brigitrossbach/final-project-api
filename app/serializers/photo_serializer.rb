class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :caption, :user_id, :username, :tags

  has_many :comments

  def username
    object.user.username
  end

end
