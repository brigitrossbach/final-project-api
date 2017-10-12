class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :likes, through: :photos
  has_many :comments, through: :photos
  has_many :tags, through: :photos
  has_secure_password
  acts_as_followable
  acts_as_follower
end
