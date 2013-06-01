require 'cms/data_loader'
extend Cms::DataLoader

if(Cms::Category.count == 0)
  my401k_product_type = create_category_type(:my401k_product, :name => 'My401k Product')

  create_category(:about_plan, :name => 'About Plan', :category_type => my401k_product_type)
  create_category(:manage_account, :name => 'Manage Account', :category_type => my401k_product_type)
  create_category(:helpful_resources, :name => 'Helpful Resources', :category_type => my401k_product_type)
  create_category(:special_offers, :name => 'Special Offers', :category_type => my401k_product_type)
  create_category(:enrollment_page, :name => 'Enrollment Page', :category_type => my401k_product_type)
  create_category(:blog, :name => 'Blog', :category_type => my401k_product_type)

  my401k_content_type_group = create_content_type_group(:my401k, :name => 'My401k')
  
  create_content_type(:article, :name => 'BcmsMy401k::Article', :content_type_group => my401k_content_type_group)
  create_content_type(:layout, :name => 'BcmsMy401k::Layout', :content_type_group => my401k_content_type_group)

  BcmsMy401k::Layout.create!(:name => 'Layout 1', description: "blah blah blah", published: true)
  BcmsMy401k::Layout.create!(:name => 'Layout 2', description: "apple orange grape", published: true)
  BcmsMy401k::Layout.create!(:name => 'Layout 3', description: "sun moon stars", published: true)
end


=begin
class ContentTypeGroup < ActiveRecord::Base
end
ContentTypeGroup.all.map{|rec| "#{rec.id}:#{rec.name}"}

class ContentType < ActiveRecord::Base
end
ContentType.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.content_type_group_id}"}

BcmsMy401k::Layout.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.description}"}
BcmsMy401k::Article.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.subtitle}:#{rec.layout_id}"}

class Category < ActiveRecord::Base
end
Category.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.category_type_id}"}

class CategoryType < ActiveRecord::Base
end
CategoryType.all.map{|rec| "#{rec.id}:#{rec.name}"}



# clean out unwanted records in the category_types and category_type_groups
puts CategoryType.all.map{|rec| "#{rec.id}:#{rec.name}"}
puts Category.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.category_type_id}"}
puts BcmsMy401k::Layout.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.description}"}
puts ContentTypeGroup.all.map{|rec| "#{rec.id}:#{rec.name}"}
puts ContentType.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.content_type_group_id}"}

(ContentType.find [13, 14]).each{|x| x.destroy }
puts ContentType.all.map{|rec| "#{rec.id}:#{rec.name}:#{rec.content_type_group_id}"}

(ContentTypeGroup.find [5]).each{|x| x.destroy }
puts ContentTypeGroup.all.map{|rec| "#{rec.id}:#{rec.name}"}
=end

