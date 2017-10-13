class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :followers, :all_following, :homepage_photos

  has_many :photos

  def homepage_photos
    userIds = object.all_following.map do |user|
      user.id
    end
    photos = Photo.where(user_id: userIds)
    return photos
  end


end
