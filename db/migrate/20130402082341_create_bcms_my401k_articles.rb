class CreateBcmsMy401kArticles < ActiveRecord::Migration
  def self.up
    Cms::ContentType.create!(:name => "BcmsMy401k::Article", :group_name => "My401k")
    create_content_table :bcms_my401k_articles, :prefix=>false do |t|
      t.belongs_to :section
      t.belongs_to :layout
      t.text :title
      t.text :sub_title
      t.text :body
      t.text :summary
      t.text :tile_title
      t.text :tile_icon

      t.timestamps
    end
  end

  def self.down
    Cms::ContentType.destroy_all("name = 'BcmsMy401k::Article'")
    Cms::ContentTypeGroup.destroy_all("name = 'My401k'")
    drop_table :bcms_my401k_articles
  end
end
