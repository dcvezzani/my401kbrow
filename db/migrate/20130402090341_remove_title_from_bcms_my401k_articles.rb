class RemoveTitleFromBcmsMy401kArticles < ActiveRecord::Migration
  def up
    remove_column :bcms_my401k_articles, :title
    remove_column :bcms_my401k_article_versions, :title
  end

  def down
    add_column :bcms_my401k_articles, :title, :text
    add_column :bcms_my401k_article_versions, :title, :text
  end
end
