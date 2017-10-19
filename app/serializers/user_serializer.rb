class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :followers, :all_following

  has_many :photos
  has_many :homepage_photos
  has_many :boards


  def homepage_photos
    userIds = object.all_following.map do |user|
      user.id
    end
    photos = Photo.where(user_id: userIds).reverse
    return photos
  end

end
