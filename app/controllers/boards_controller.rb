class BoardsController < ApplicationController

  def create
    user=User.find(params[:user_id])
    Board.create(name: params[:name], user_id: user.id)
    render json: user
  end

end
