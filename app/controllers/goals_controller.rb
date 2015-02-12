class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]

  def new
    @game = Game.find(params[:game_id])
    @goal = Goal.new
  end

  def edit
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @goal = @game.goals.new(goal_params)

    if @goal.save
      redirect_to @game, notice: 'Score!'
    else
      render :new
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url, notice: 'Goal was successfully destroyed.'
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(
        :id,
        :game_id,
        :team_id,
        :scorer_id,
        :primary_assister_id,
        :secondary_assister_id,
        :category
      )
    end
end
