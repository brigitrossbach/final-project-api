class Board < ApplicationRecord
  has_many :photo_boards
  has_many :photos, through: :photo_boards
  belongs_to :user
end
