class GamesController < ApplicationController
  def index
    @games = Game.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @games }
    end
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @game }
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.update(game_params)
    @game.save
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:id, :state)
  end

end
