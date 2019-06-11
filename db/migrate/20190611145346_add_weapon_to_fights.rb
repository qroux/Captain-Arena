class AddWeaponToFights < ActiveRecord::Migration[5.2]
  def change
    add_reference :fights, :player_weapon, foreign_key: { to_table: :weapons }
    add_reference :fights, :opponent_weapon, foreign_key: { to_table: :weapons }
  end
end
