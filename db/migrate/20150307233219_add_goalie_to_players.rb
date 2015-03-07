class AddGoalieToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :goalie, :boolean, default: false
  end
end
