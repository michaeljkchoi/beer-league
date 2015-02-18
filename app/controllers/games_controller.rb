class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @series = Series.find(params[:series_id])
    @games = @series.games
  end

  def show
    @series = @game.series
    @teams = @series.teams
    @home = @game.home_team
    @away = @game.away_team
  end

  def new
    @series = Series.find(params[:series_id])
    @game = Game.new
    @teams = @series.teams
    @reserves = Player.reserves
  end

  def edit
    @teams = @game.series.teams
    @reserves = Player.reserves
  end

  def create
    @series = Series.find(params[:series_id])
    @teams = @series.teams
    @game = @series.games.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @series = @game.series
    @game.destroy
    redirect_to series_games_url(@series), notice: 'Game was successfully destroyed.'
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(
        :id,
        :date,
        :home_team_id,
        :away_team_id,
        player_ids: []
      )
    end
end
