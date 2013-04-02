class CreateBcmsMy401kLayouts < ActiveRecord::Migration
  def self.up
    Cms::ContentType.create!(:name => "BcmsMy401k::Layout", :group_name => "My401k")
    create_content_table :bcms_my401k_layouts, :prefix=>false do |t|
      
      t.text :description

      t.timestamps
    end
  end

  def self.down
    Cms::ContentType.destroy_all("name = 'BcmsMy401k::Layout'")
    #Cms::ContentTypeGroup.destroy_all("name = 'My401k'")
    drop_table :bcms_my401k_layouts
  end
end
