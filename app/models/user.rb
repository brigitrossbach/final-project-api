class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :likes, through: :photos
  has_many :comments, through: :photos
  has_many :tags, through: :photos
end
