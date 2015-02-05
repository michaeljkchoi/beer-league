class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :scorer_id
      t.integer :primary_assister_id
      t.integer :secondary_assister_id
      t.string :category

      t.timestamps
    end
    add_index :goals, :game_id
    add_index :goals, :team_id
    add_index :goals, :scorer_id
    add_index :goals, :primary_assister_id
    add_index :goals, :secondary_assister_id
  end
end
