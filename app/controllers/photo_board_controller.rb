class PhotoBoardController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    board = Board.find(params[:board_id])
    PhotoBoard.create(photo_id: photo.id, board_id: board.id)
    render json: board
  end
end
