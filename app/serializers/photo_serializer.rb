class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :tags, :user_id
  has_many :tags
end
