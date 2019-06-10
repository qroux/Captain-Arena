class AddPhotoToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :photo, :string
  end
end
