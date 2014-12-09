class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :captain_id
      t.string :logo

      t.timestamps
    end
    add_index :teams, :captain_id
  end
end
