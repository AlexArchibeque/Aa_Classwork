class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
      t.timestamps
    end

    remove_column :users, :age
    rename_column :users, :name, :username
    remove_column :users, :breed

    add_index :artworks,[:artist_id, :title], unique: true

    add_index :users, :username, unique: true
  end
end
