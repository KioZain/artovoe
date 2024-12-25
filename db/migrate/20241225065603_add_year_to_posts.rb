class AddYearToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :year, :integer
  end
end
