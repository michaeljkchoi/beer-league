class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :team_id

      t.timestamps
    end
    add_index :lineups, :player_id
    add_index :lineups, :game_id
    add_index :lineups, :team_id
  end
end
