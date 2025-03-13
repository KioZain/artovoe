class RemoveLinkFromDisplays < ActiveRecord::Migration[7.2]
  def change
    remove_column :displays, :link, :string
  end
end
