class TagSerializer < ActiveModel::Serializer
  attributes :tag, :id
  belongs_to :photo
end
