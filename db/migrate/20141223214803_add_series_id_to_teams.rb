class AddSeriesIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :series_id, :integer
    add_index :teams, :series_id
  end
end
