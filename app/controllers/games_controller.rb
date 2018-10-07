require 'pry'

class GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
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
    render json: @game
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game = Game.update(game_params)
    @game.save
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:state)
  end

end
