class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :player, index: true, foreign_key: { to_table: :fighters }
      t.references :opponent, index: true, foreign_key: { to_table: :fighters }

      t.timestamps
    end
  end
end
