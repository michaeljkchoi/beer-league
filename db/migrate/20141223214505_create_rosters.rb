class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
    add_index :rosters, :team_id
    add_index :rosters, :player_id
  end
end
