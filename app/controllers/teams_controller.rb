class TeamsController < ApplicationController
  before_action :set_team, except: :index

  def index
    @series = Series.find(params[:series_id])
    @teams = @series.teams.limit(2)
  end

  def show
    @series = @team.series
  end

  def edit
    @series = @team.series
    @players = @series.available_players
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @series = @team.series
    @team.destroy
    redirect_to series_teams_url(@series), 
      notice: 'Team was successfully destroyed.'
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(
        :id,
        :name,
        :logo,
        player_ids: []
      )
    end
end
