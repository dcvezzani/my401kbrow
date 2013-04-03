require 'cms/data_loader'
extend Cms::DataLoader

if(Cms::Category.count == 0)
  my401k_product_type = create_category_type(:guest, :name => 'My401k Product')

  create_category(:about_plan, :name => 'About Plan', :category_type => my401k_product_type)
  create_category(:manage_account, :name => 'Manage Account', :category_type => my401k_product_type)
  create_category(:helpful_resources, :name => 'Helpful Resources', :category_type => my401k_product_type)
  create_category(:special_offers, :name => 'Special Offers', :category_type => my401k_product_type)
  create_category(:enrollment_page, :name => 'Enrollment Page', :category_type => my401k_product_type)
  create_category(:blog, :name => 'Blog', :category_type => my401k_product_type)
end

