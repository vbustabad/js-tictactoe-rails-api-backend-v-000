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
    Game.create(state: params[:state])
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
    @game = Game.update(state: params[:state])
    @game.save
    redirect_to game_path(@game)
  end

end
