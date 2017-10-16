class Photo < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :comments
  has_many :likes
end
