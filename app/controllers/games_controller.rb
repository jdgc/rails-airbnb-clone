class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render :new
  end

  def edit
    @game = Game.new(game_params)
  end

  def update
     @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def delete
    @game = Game.find(params[:id])
    @game.destroy
  end


  private

  def game_params
    require(:game).permit(:title, :desription, :console)
  end
end
end
