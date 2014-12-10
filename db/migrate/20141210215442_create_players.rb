class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :number
      t.string :email
      t.string :phone_number
      t.string :profile

      t.timestamps
    end
  end
end
