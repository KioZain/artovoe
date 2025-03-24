class AddTotalLikesToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :total_likes, :integer, default: 0
  end
end
