class ChangeYearToIntegerInDisplays < ActiveRecord::Migration[7.2]
  def up
    change_column :displays, :year, :integer, using: 'year::integer'
  end
end
