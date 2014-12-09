class RenameTableSeasons < ActiveRecord::Migration
  def change
    rename_table :seasons, :series
  end
end
