class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :photos

  has_many :photos

  def username
    object.user.username
  end
end
