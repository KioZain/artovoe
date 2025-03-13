class AddLikesCountToCollections < ActiveRecord::Migration[7.2]
  def change
    add_column :collections, :likes_count, :integer, default: 0
  end
end
