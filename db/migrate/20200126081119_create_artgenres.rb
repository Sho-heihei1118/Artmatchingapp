class CreateArtgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :artgenres do |t|
      t.text :name
      t.text :memo

      t.timestamps
    end
  end
end
