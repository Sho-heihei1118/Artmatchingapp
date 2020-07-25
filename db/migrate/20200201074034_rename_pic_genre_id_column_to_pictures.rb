class RenamePicGenreIdColumnToPictures < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :pic_genre_id, :artgenre_id
  end
end
