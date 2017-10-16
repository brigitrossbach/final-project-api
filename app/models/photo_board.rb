class PhotoBoard < ApplicationRecord
  belongs_to :board
  belongs_to :photo
end
