class AddPathToSites < ActiveRecord::Migration
  def change
    add_column :sites, :path, :text
  end
end
