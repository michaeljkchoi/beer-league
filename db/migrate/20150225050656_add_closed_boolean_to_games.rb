class AddClosedBooleanToGames < ActiveRecord::Migration
  def change
    add_column :games, :closed, :boolean, default: false
  end
end
