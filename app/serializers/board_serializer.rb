class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :username

  def username
    object.user.username
  end
end
