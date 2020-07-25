class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :pic_title
      t.string :picture
      t.text :pic_description
      t.datetime :pic_created_date
      t.integer :artgenre_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :pictures, [:user_id, :pic_created_date]
  end
end
