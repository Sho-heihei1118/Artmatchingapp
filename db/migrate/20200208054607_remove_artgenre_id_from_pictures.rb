class RemoveArtgenreIdFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :pic_genre_id, :integer
  end
end
