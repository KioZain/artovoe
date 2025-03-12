class AddAspectRatioToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :aspect_ratio, :string
  end
end
