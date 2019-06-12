class AddLuckToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :luck, :float
  end
end
