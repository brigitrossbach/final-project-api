class Photo < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :photo_boards
  has_many :boards, through: :photo_boards
  paginates_per 12
end
