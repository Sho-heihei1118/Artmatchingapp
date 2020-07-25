class AddCarreerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :carreer, :text
  end
end
