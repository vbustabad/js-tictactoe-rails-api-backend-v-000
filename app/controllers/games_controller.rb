require 'pry'

class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]

  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(state: game_params)
    redirect_to games_path
  end

  def show
    render json: @game
  end

  def edit
  end

  def update
    @game = Game.update(state: game_params)
    @game.save
    redirect_to game_path(@game)
  end

  private

  def game_params
    params[:state]
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
