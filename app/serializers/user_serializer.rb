class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :follower_count, :following_count, :followers, :all_following,
  :post_count, :bio

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

  def post_count
    object.photos.count
  end

  def follower_count
    object.followers.count
  end

  def following_count
    object.all_following.count
  end

end
