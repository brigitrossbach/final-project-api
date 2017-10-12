class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :tags, :caption, :user_id, :user
  has_many :tags
  belongs_to :user
end
