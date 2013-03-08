class AddIdentifierAndLocaleToSites < ActiveRecord::Migration
  def change
    add_column :sites, :identifier, :text
    add_column :sites, :locale, :string
  end
end
