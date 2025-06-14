class CreateFavourites < ActiveRecord::Migration[7.2]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favouriteable, polymorphic: true, null: false

      t.timestamps
    end
    add_index :favourites, [ :user_id, :favouriteable_type, :favouriteable_id ], unique: true, name: "index_favourites_on_user_and_favouriteable"
  end
end
