class CreateGenrePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :genre_pictures do |t|
      t.integer :artgenre_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
