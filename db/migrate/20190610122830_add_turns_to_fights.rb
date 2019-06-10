class AddTurnsToFights < ActiveRecord::Migration[5.2]
  def change
    add_column :fights, :player_turns, :integer, array: true, default: []
    add_column :fights, :opponent_turns, :integer, array: true, default: []
  end
end
