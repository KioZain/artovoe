class AddCityToDisplays < ActiveRecord::Migration[7.2]
  def change
    add_column :displays, :city, :string
  end
end
