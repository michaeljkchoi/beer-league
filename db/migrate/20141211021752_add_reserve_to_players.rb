class AddReserveToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :reserve, :boolean, default: false
  end
end
