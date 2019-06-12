class AddMatchCountToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :match_count, :integer, default: 0
    add_column :fighters, :win, :integer, default: 0
  end
end
