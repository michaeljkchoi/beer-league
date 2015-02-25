class GamesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_game, only: [:show, :edit, :update, :destroy, :close]
  before_action :check_lineup_boolean, only: [:create, :update]

  def close
    if @game.update(closed: true)
      redirect_to @game.series, notice: 'Game has been closed.'
    else
      redirect_to @game, alert: 'Game could not be closed.'
    end
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
  end

  def edit
    @teams = @game.series.teams
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
    if @game.closed
      redirect_to @series, alert: 'A closed game cannot be deleted.'
    else
      @game.destroy
      redirect_to series_games_url(@series), notice: 'Game was successfully destroyed.'
    end
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
        lineups_attributes: [
          :id,
          :_destroy,
          :player_id,
          :team_id,
          :player_boolean
        ]
      )
    end

    def check_lineup_boolean
      lineups = params[:game][:lineups_attributes]
      if lineups.present?
        lineups.each do |index, lineup|
          lineup[:_destroy] = true unless lineup[:player_boolean] == '1'
        end
      end
    end
end
