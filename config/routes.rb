Cms::Engine.routes.draw do

  match '/super_administration', :to=>"sites#index", :as=>'super_administration'

  resources :sites do
  end
  get '/sites/:id/edit', to: 'sites#edit', as: 'edit_cms_site'
  get '/sites/new', to: 'sites#new', as: 'new_cms_site'
  # get '/pages/:id/version/:version', :to=>'pages#version', :as=>'version_cms_page'
  # put '/pages/:id/revert_to/:version', :to=>'pages#revert_to', :as=>'revert_page'
end

BrowsercmsDemo::Application.routes.draw do

  root :to => 'My401k::Guest#pricing_and_support'

  post "/file/post" => "My401k::Guest#welcome"

  ### Guest - top nav
  get "my401k/guest/welcome"
  get "my401k/guest/what_is_it" => "My401k::Guest#guest_what_is_it", as: "guest_what_is_it"
  get "my401k/guest/how_does_it_work" => "My401k::Guest#how_does_it_work", as: "guest_how_does_it_work"
  get "my401k/guest/why_do_it" => "My401k::Guest#why_do_it", as: "guest_why_do_it"
  get "my401k/guest/pricing_and_support" => "My401k::Guest#pricing_and_support", as: "guest_pricing_and_support"
  get "my401k/guest/join_now" => "My401k::Guest#join_now", as: "guest_join_now"

  ### Plug-in Author - top nav
  match "/my401k/plug_in_author" => redirect("/my401k/plug_in_author/manage_profile")
  get "my401k/plug_in_author/manage_profile" => "My401k::PlugInAuthor::ManageProfile#index", as: "plug_in_author_manage_profile"
  get "my401k/plug_in_author/promote_plug_ins" => "My401k::PlugInAuthor::PromotePlugIns#index", as: "plug_in_author_promote_plug_ins"

  ### Plug-in Author - Manage Content Bundles
  match "/my401k/plug_in_author/manage_content/bundles" => redirect("/my401k/plug_in_author/manage_content/bundles/published")
  match "/my401k/plug_in_author/manage_content/bundles/index" => redirect("/my401k/plug_in_author/manage_content/bundles/published")
  get "my401k/plug_in_author/manage_content/bundles/move_to_bundle" => "My401k::PlugInAuthor::ManageContent::Bundles#move_to_bundle", as: "plug_in_author_manage_content_bundles_move_to_bundle"
  get "my401k/plug_in_author/manage_content/bundles/destroy" => "My401k::PlugInAuthor::ManageContent::Bundles#destroy", as: "plug_in_author_manage_content_bundles_destroy"
  get "my401k/plug_in_author/manage_content/bundles/published" => "My401k::PlugInAuthor::ManageContent::Bundles#published", as: "plug_in_author_manage_content_bundles_published"
  get "my401k/plug_in_author/manage_content/bundles/drafted" => "My401k::PlugInAuthor::ManageContent::Bundles#drafted", as: "plug_in_author_manage_content_bundles_drafted"
  get "my401k/plug_in_author/manage_content/bundles/product_summary_by_all_types" => "My401k::PlugInAuthor::ManageContent::Bundles#product_summary_by_all_types", as: "plug_in_author_manage_content_bundles_product_summary_by_all_types"
  get "my401k/plug_in_author/manage_content/bundles/product_summary_by_type" => "My401k::PlugInAuthor::ManageContent::Bundles#product_summary_by_type", as: "plug_in_author_manage_content_bundles_product_summary_by_type"
  get "my401k/plug_in_author/manage_content/bundles/product_summary_by_all_categories" => "My401k::PlugInAuthor::ManageContent::Bundles#product_summary_by_all_categories", as: "plug_in_author_manage_content_bundles_product_summary_by_all_categories"
  get "my401k/plug_in_author/manage_content/bundles/product_summary_by_category" => "My401k::PlugInAuthor::ManageContent::Bundles#product_summary_by_category", as: "plug_in_author_manage_content_bundles_product_summary_by_category"
  get "my401k/plug_in_author/manage_content/bundles/details_summaries" => "My401k::PlugInAuthor::ManageContent::Bundles#details_summaries", as: "plug_in_author_manage_content_bundles_details_summaries"
  get "my401k/plug_in_author/manage_content/bundles/details_summary" => "My401k::PlugInAuthor::ManageContent::Bundles#details_summary", as: "plug_in_author_manage_content_bundles_details_summary"
  get "my401k/plug_in_author/manage_content/bundles/details_product" => "My401k::PlugInAuthor::ManageContent::Bundles#details_product", as: "plug_in_author_manage_content_bundles_details_product"
  get "my401k/plug_in_author/manage_content/bundles/publish" => "My401k::PlugInAuthor::ManageContent::Bundles#publish", as: "plug_in_author_manage_content_bundles_publish"
  get "my401k/plug_in_author/manage_content/bundles/clone_draft" => "My401k::PlugInAuthor::ManageContent::Bundles#clone_draft", as: "plug_in_author_manage_content_bundles_clone_draft"
  get "my401k/plug_in_author/manage_content/bundles/move_to_draft" => "My401k::PlugInAuthor::ManageContent::Bundles#move_to_draft", as: "plug_in_author_manage_content_bundles_move_to_draft"
  get "my401k/plug_in_author/manage_content/bundles/edit" => "My401k::PlugInAuthor::ManageContent::Bundles#edit", as: "plug_in_author_manage_content_bundles_edit"
  get "my401k/plug_in_author/manage_content/bundles/destroy" => "My401k::PlugInAuthor::ManageContent::Bundles#destroy", as: "plug_in_author_manage_content_bundles_destroy"
  get "my401k/plug_in_author/manage_content/bundles/search" => "My401k::PlugInAuthor::ManageContent::Bundles#search", as: "plug_in_author_manage_content_bundles_search"
  get "my401k/plug_in_author/manage_content/bundles/filter" => "My401k::PlugInAuthor::ManageContent::Bundles#filter", as: "plug_in_author_manage_content_bundles_filter"
  get "my401k/plug_in_author/manage_content/bundles/help" => "My401k::PlugInAuthor::ManageContent::Bundles#help", as: "plug_in_author_manage_content_bundles_help"

  ### Plug-in Author - Manage Content Products
  match "/my401k/plug_in_author/manage_content/products" => redirect("/my401k/plug_in_author/manage_content/products/published")
  match "/my401k/plug_in_author/manage_content/products/index" => redirect("/my401k/plug_in_author/manage_content/products/published")
  get "my401k/plug_in_author/manage_content/products/move_to_bundle" => "My401k::PlugInAuthor::ManageContent::Products#move_to_bundle", as: "plug_in_author_manage_content_products_move_to_bundle"
  get "my401k/plug_in_author/manage_content/products/destroy" => "My401k::PlugInAuthor::ManageContent::Products#destroy", as: "plug_in_author_manage_content_products_destroy"
  get "my401k/plug_in_author/manage_content/products/published" => "My401k::PlugInAuthor::ManageContent::Products#published", as: "plug_in_author_manage_content_products_published"
  get "my401k/plug_in_author/manage_content/products/drafted" => "My401k::PlugInAuthor::ManageContent::Products#drafted", as: "plug_in_author_manage_content_products_drafted"
  get "my401k/plug_in_author/manage_content/products/product_summary_by_all_types" => "My401k::PlugInAuthor::ManageContent::Products#product_summary_by_all_types", as: "plug_in_author_manage_content_products_product_summary_by_all_types"
  get "my401k/plug_in_author/manage_content/products/product_summary_by_type" => "My401k::PlugInAuthor::ManageContent::Products#product_summary_by_type", as: "plug_in_author_manage_content_products_product_summary_by_type"
  get "my401k/plug_in_author/manage_content/products/product_summary_by_all_categories" => "My401k::PlugInAuthor::ManageContent::Products#product_summary_by_all_categories", as: "plug_in_author_manage_content_products_product_summary_by_all_categories"
  get "my401k/plug_in_author/manage_content/products/product_summary_by_category" => "My401k::PlugInAuthor::ManageContent::Products#product_summary_by_category", as: "plug_in_author_manage_content_products_product_summary_by_category"
  get "my401k/plug_in_author/manage_content/products/details_summaries" => "My401k::PlugInAuthor::ManageContent::Products#details_summaries", as: "plug_in_author_manage_content_products_details_summaries"
  get "my401k/plug_in_author/manage_content/products/details_summary" => "My401k::PlugInAuthor::ManageContent::Products#details_summary", as: "plug_in_author_manage_content_products_details_summary"
  get "my401k/plug_in_author/manage_content/products/details_product" => "My401k::PlugInAuthor::ManageContent::Products#details_product", as: "plug_in_author_manage_content_products_details_product"
  get "my401k/plug_in_author/manage_content/products/publish" => "My401k::PlugInAuthor::ManageContent::Products#publish", as: "plug_in_author_manage_content_products_publish"
  get "my401k/plug_in_author/manage_content/products/clone_draft" => "My401k::PlugInAuthor::ManageContent::Products#clone_draft", as: "plug_in_author_manage_content_products_clone_draft"
  get "my401k/plug_in_author/manage_content/products/move_to_draft" => "My401k::PlugInAuthor::ManageContent::Products#move_to_draft", as: "plug_in_author_manage_content_products_move_to_draft"
  get "my401k/plug_in_author/manage_content/products/edit" => "My401k::PlugInAuthor::ManageContent::Products#edit", as: "plug_in_author_manage_content_products_edit"
  get "my401k/plug_in_author/manage_content/products/destroy" => "My401k::PlugInAuthor::ManageContent::Products#destroy", as: "plug_in_author_manage_content_products_destroy"
  get "my401k/plug_in_author/manage_content/products/search" => "My401k::PlugInAuthor::ManageContent::Products#search", as: "plug_in_author_manage_content_products_search"
  get "my401k/plug_in_author/manage_content/products/filter" => "My401k::PlugInAuthor::ManageContent::Products#filter", as: "plug_in_author_manage_content_products_filter"
  get "my401k/plug_in_author/manage_content/products/help" => "My401k::PlugInAuthor::ManageContent::Products#help", as: "plug_in_author_manage_content_products_help"

  ### Plug-in Author - Manage Content Products - published mockups
  get "my401k/plug_in_author/manage_content/published_products/product_summary_by_type_main_section" => "My401k::PlugInAuthor::ManageContent::PublishedProducts#product_summary_by_type_main_section", as: "plug_in_author_manage_content_published_products_product_summary_by_type_main_section"
  get "my401k/plug_in_author/manage_content/published_products/product_summary_by_type_blog_post" => "My401k::PlugInAuthor::ManageContent::PublishedProducts#product_summary_by_type_blog_post", as: "plug_in_author_manage_content_published_products_product_summary_by_type_blog_post"
  get "my401k/plug_in_author/manage_content/published_products/product_summary_by_type_headline_banner" => "My401k::PlugInAuthor::ManageContent::PublishedProducts#product_summary_by_type_headline_banner", as: "plug_in_author_manage_content_published_products_product_summary_by_type_headline_banner"

  ### Plug-in Author - Manage Content Products - drafted mockups
  get "my401k/plug_in_author/manage_content/drafted_products/product_summary_by_type_main_section" => "My401k::PlugInAuthor::ManageContent::DraftedProducts#product_summary_by_type_main_section", as: "plug_in_author_manage_content_drafted_products_product_summary_by_type_main_section"
  get "my401k/plug_in_author/manage_content/drafted_products/product_summary_by_type_blog_post" => "My401k::PlugInAuthor::ManageContent::DraftedProducts#product_summary_by_type_blog_post", as: "plug_in_author_manage_content_drafted_products_product_summary_by_type_blog_post"
  get "my401k/plug_in_author/manage_content/drafted_products/product_summary_by_type_headline_banner" => "My401k::PlugInAuthor::ManageContent::DraftedProducts#product_summary_by_type_headline_banner", as: "plug_in_author_manage_content_drafted_products_product_summary_by_type_headline_banner"

  ### Plug-in Author - Manage Content Bundles (wireframe)
  match "/my401k/plug_in_author/manage_content_wf/bundles" => redirect("/my401k/plug_in_author/manage_content_wf/bundles/published")
  match "/my401k/plug_in_author/manage_content_wf/bundles/index" => redirect("/my401k/plug_in_author/manage_content_wf/bundles/published")
  get "my401k/plug_in_author/manage_content_wf/bundles/move_to_bundle" => "My401k::PlugInAuthor::ManageContentWf::Bundles#move_to_bundle", as: "plug_in_author_manage_content_wf_bundles_move_to_bundle"
  get "my401k/plug_in_author/manage_content_wf/bundles/destroy" => "My401k::PlugInAuthor::ManageContentWf::Bundles#destroy", as: "plug_in_author_manage_content_wf_bundles_destroy"
  get "my401k/plug_in_author/manage_content_wf/bundles/published" => "My401k::PlugInAuthor::ManageContentWf::Bundles#published", as: "plug_in_author_manage_content_wf_bundles_published"
  get "my401k/plug_in_author/manage_content_wf/bundles/drafted" => "My401k::PlugInAuthor::ManageContentWf::Bundles#drafted", as: "plug_in_author_manage_content_wf_bundles_drafted"
  get "my401k/plug_in_author/manage_content_wf/bundles/bundle_summary_by_all_types" => "My401k::PlugInAuthor::ManageContentWf::Bundles#bundle_summary_by_all_types", as: "plug_in_author_manage_content_wf_bundles_bundle_summary_by_all_types"
  get "my401k/plug_in_author/manage_content_wf/bundles/bundle_summary_by_type" => "My401k::PlugInAuthor::ManageContentWf::Bundles#bundle_summary_by_type", as: "plug_in_author_manage_content_wf_bundles_bundle_summary_by_type"
  get "my401k/plug_in_author/manage_content_wf/bundles/bundle_summary_by_all_categories" => "My401k::PlugInAuthor::ManageContentWf::Bundles#bundle_summary_by_all_categories", as: "plug_in_author_manage_content_wf_bundles_bundle_summary_by_all_categories"
  get "my401k/plug_in_author/manage_content_wf/bundles/bundle_summary_by_category" => "My401k::PlugInAuthor::ManageContentWf::Bundles#bundle_summary_by_category", as: "plug_in_author_manage_content_wf_bundles_bundle_summary_by_category"
  get "my401k/plug_in_author/manage_content_wf/bundles/details_summaries" => "My401k::PlugInAuthor::ManageContentWf::Bundles#details_summaries", as: "plug_in_author_manage_content_wf_bundles_details_summaries"
  get "my401k/plug_in_author/manage_content_wf/bundles/details_summary" => "My401k::PlugInAuthor::ManageContentWf::Bundles#details_summary", as: "plug_in_author_manage_content_wf_bundles_details_summary"
  get "my401k/plug_in_author/manage_content_wf/bundles/details_bundle" => "My401k::PlugInAuthor::ManageContentWf::Bundles#details_bundle", as: "plug_in_author_manage_content_wf_bundles_details_bundle"
  get "my401k/plug_in_author/manage_content_wf/bundles/publish" => "My401k::PlugInAuthor::ManageContentWf::Bundles#publish", as: "plug_in_author_manage_content_wf_bundles_publish"
  get "my401k/plug_in_author/manage_content_wf/bundles/clone_draft" => "My401k::PlugInAuthor::ManageContentWf::Bundles#clone_draft", as: "plug_in_author_manage_content_wf_bundles_clone_draft"
  get "my401k/plug_in_author/manage_content_wf/bundles/move_to_draft" => "My401k::PlugInAuthor::ManageContentWf::Bundles#move_to_draft", as: "plug_in_author_manage_content_wf_bundles_move_to_draft"
  get "my401k/plug_in_author/manage_content_wf/bundles/edit" => "My401k::PlugInAuthor::ManageContentWf::Bundles#edit", as: "plug_in_author_manage_content_wf_bundles_edit"
  get "my401k/plug_in_author/manage_content_wf/bundles/destroy" => "My401k::PlugInAuthor::ManageContentWf::Bundles#destroy", as: "plug_in_author_manage_content_wf_bundles_destroy"
  get "my401k/plug_in_author/manage_content_wf/bundles/search" => "My401k::PlugInAuthor::ManageContentWf::Bundles#search", as: "plug_in_author_manage_content_wf_bundles_search"
  get "my401k/plug_in_author/manage_content_wf/bundles/filter" => "My401k::PlugInAuthor::ManageContentWf::Bundles#filter", as: "plug_in_author_manage_content_wf_bundles_filter"
  get "my401k/plug_in_author/manage_content_wf/bundles/help" => "My401k::PlugInAuthor::ManageContentWf::Bundles#help", as: "plug_in_author_manage_content_wf_bundles_help"
  
  ### Plug-in Author - Manage Content Products (wireframe)
  match "/my401k/plug_in_author/manage_content_wf/products" => redirect("/my401k/plug_in_author/manage_content_wf/products/published")
  match "/my401k/plug_in_author/manage_content_wf/products/index" => redirect("/my401k/plug_in_author/manage_content_wf/products/published")
  get "my401k/plug_in_author/manage_content_wf/products/move_to_bundle" => "My401k::PlugInAuthor::ManageContentWf::Products#move_to_bundle", as: "plug_in_author_manage_content_wf_products_move_to_bundle"
  get "my401k/plug_in_author/manage_content_wf/products/destroy" => "My401k::PlugInAuthor::ManageContentWf::Products#destroy", as: "plug_in_author_manage_content_wf_products_destroy"
  get "my401k/plug_in_author/manage_content_wf/products/published" => "My401k::PlugInAuthor::ManageContentWf::Products#published", as: "plug_in_author_manage_content_wf_products_published"
  get "my401k/plug_in_author/manage_content_wf/products/drafted" => "My401k::PlugInAuthor::ManageContentWf::Products#drafted", as: "plug_in_author_manage_content_wf_products_drafted"
  get "my401k/plug_in_author/manage_content_wf/products/product_summary_by_all_types" => "My401k::PlugInAuthor::ManageContentWf::Products#product_summary_by_all_types", as: "plug_in_author_manage_content_wf_products_product_summary_by_all_types"
  get "my401k/plug_in_author/manage_content_wf/products/product_summary_by_type" => "My401k::PlugInAuthor::ManageContentWf::Products#product_summary_by_type", as: "plug_in_author_manage_content_wf_products_product_summary_by_type"
  get "my401k/plug_in_author/manage_content_wf/products/product_summary_by_all_categories" => "My401k::PlugInAuthor::ManageContentWf::Products#product_summary_by_all_categories", as: "plug_in_author_manage_content_wf_products_product_summary_by_all_categories"
  get "my401k/plug_in_author/manage_content_wf/products/product_summary_by_category" => "My401k::PlugInAuthor::ManageContentWf::Products#product_summary_by_category", as: "plug_in_author_manage_content_wf_products_product_summary_by_category"
  get "my401k/plug_in_author/manage_content_wf/products/details_summaries" => "My401k::PlugInAuthor::ManageContentWf::Products#details_summaries", as: "plug_in_author_manage_content_wf_products_details_summaries"
  get "my401k/plug_in_author/manage_content_wf/products/details_summary" => "My401k::PlugInAuthor::ManageContentWf::Products#details_summary", as: "plug_in_author_manage_content_wf_products_details_summary"
  get "my401k/plug_in_author/manage_content_wf/products/details_product" => "My401k::PlugInAuthor::ManageContentWf::Products#details_product", as: "plug_in_author_manage_content_wf_products_details_product"
  get "my401k/plug_in_author/manage_content_wf/products/publish" => "My401k::PlugInAuthor::ManageContentWf::Products#publish", as: "plug_in_author_manage_content_wf_products_publish"
  get "my401k/plug_in_author/manage_content_wf/products/clone_draft" => "My401k::PlugInAuthor::ManageContentWf::Products#clone_draft", as: "plug_in_author_manage_content_wf_products_clone_draft"
  get "my401k/plug_in_author/manage_content_wf/products/move_to_draft" => "My401k::PlugInAuthor::ManageContentWf::Products#move_to_draft", as: "plug_in_author_manage_content_wf_products_move_to_draft"
  get "my401k/plug_in_author/manage_content_wf/products/edit" => "My401k::PlugInAuthor::ManageContentWf::Products#edit", as: "plug_in_author_manage_content_wf_products_edit"
  get "my401k/plug_in_author/manage_content_wf/products/destroy" => "My401k::PlugInAuthor::ManageContentWf::Products#destroy", as: "plug_in_author_manage_content_wf_products_destroy"
  get "my401k/plug_in_author/manage_content_wf/products/search" => "My401k::PlugInAuthor::ManageContentWf::Products#search", as: "plug_in_author_manage_content_wf_products_search"
  get "my401k/plug_in_author/manage_content_wf/products/filter" => "My401k::PlugInAuthor::ManageContentWf::Products#filter", as: "plug_in_author_manage_content_wf_products_filter"
  get "my401k/plug_in_author/manage_content_wf/products/help" => "My401k::PlugInAuthor::ManageContentWf::Products#help", as: "plug_in_author_manage_content_wf_products_help"

  ### Plug In Author - Create New Content
  match "/my401k/plug_in_author/create_new_content" => redirect("/my401k/plug_in_author/create_new_content/select_section")
  match "/my401k/plug_in_author/create_new_content/index" => redirect("/my401k/plug_in_author/create_new_content/select_section")
  get "my401k/plug_in_author/create_new_content/select_section" => "My401k::PlugInAuthor::CreateNewContent#select_section", as: "plug_in_author_create_new_content"
  get "my401k/plug_in_author/create_new_content/select_section" => "My401k::PlugInAuthor::CreateNewContent#select_section", as: "plug_in_author_create_new_content_select_section"
  get "my401k/plug_in_author/create_new_content/select_layout" => "My401k::PlugInAuthor::CreateNewContent#select_layout", as: "plug_in_author_create_new_content_select_layout"
  get "my401k/plug_in_author/create_new_content/create_title_and_body" => "My401k::PlugInAuthor::CreateNewContent#create_title_and_body", as: "plug_in_author_create_new_content_create_title_and_body"
  get "my401k/plug_in_author/create_new_content/create_tile" => "My401k::PlugInAuthor::CreateNewContent#create_tile", as: "plug_in_author_create_new_content_create_tile"
  get "my401k/plug_in_author/create_new_content/optional_elections" => "My401k::PlugInAuthor::CreateNewContent#optional_elections", as: "plug_in_author_create_new_content_optional_elections"
  get "my401k/plug_in_author/create_new_content/point_content" => "My401k::PlugInAuthor::CreateNewContent#point_content", as: "plug_in_author_create_new_content_point_content"
  get "my401k/plug_in_author/create_new_content/preview_page" => "My401k::PlugInAuthor::CreateNewContent#preview_page", as: "plug_in_author_create_new_content_preview_page"

  ### Plug In Author - Reports
  match "/my401k/plug_in_author/reports" => redirect("/my401k/plug_in_author/reports/report_001")
  match "/my401k/plug_in_author/reports/index" => redirect("/my401k/plug_in_author/reports/report_001")
  get "my401k/plug_in_author/reports/report_001" => "My401k::PlugInAuthor::Reports#report_001", as: "plug_in_author_reports"
  get "my401k/plug_in_author/reports/report_001" => "My401k::PlugInAuthor::Reports#report_001", as: "plug_in_author_reports_report_001"
  get "my401k/plug_in_author/reports/report_002" => "My401k::PlugInAuthor::Reports#report_002", as: "plug_in_author_reports_report_002"
  get "my401k/plug_in_author/reports/report_003" => "My401k::PlugInAuthor::Reports#report_003", as: "plug_in_author_reports_report_003"
  get "my401k/plug_in_author/reports/report_004" => "My401k::PlugInAuthor::Reports#report_004", as: "plug_in_author_reports_report_004"
 

  ### Plan Sponsor - top nav
  match "/my401k/plan_sponsor" => redirect("/my401k/plan_sponsor/manage_profile")
  get "my401k/plan_sponsor/manage_profile" => "My401k::PlanSponsor::ManageProfile#basic_information", as: "plan_sponsor_manage_profile"
  get "my401k/plan_sponsor/promote_plan_portal" => "My401k::PlanSponsor::PromotePlanPortal#print_material", as: "plan_sponsor_promote_plan_portal"
  get "my401k/plan_sponsor/manage_content" => "My401k::PlanSponsor::ManageContent#published_content", as: "plan_sponsor_manage_content"
  get "my401k/plan_sponsor/professional_help" => "My401k::PlanSponsor::ProfessionalHelp#index", as: "plan_sponsor_professional_help"
  get "my401k/plan_sponsor/create_new_content" => "My401k::PlanSponsor::CreateNewContent#index", as: "plan_sponsor_create_new_content"

  ### Plan Sponsor - Promote Plan Portal
  match "/my401k/plan_sponsor/promote_plan_portal" => redirect("/my401k/plan_sponsor/promote_plan_portal/print_material")
  match "/my401k/plan_sponsor/promote_plan_portal/index" => redirect("/my401k/plan_sponsor/promote_plan_portal/print_material")
  get "my401k/plan_sponsor/promote_plan_portal/print_material" => "My401k::PlanSponsor::PromotePlanPortal#print_material", as: "plan_sponsor_promote_plan_portal_print_material"
  get "my401k/plan_sponsor/promote_plan_portal/email_templates" => "My401k::PlanSponsor::PromotePlanPortal#email_templates", as: "plan_sponsor_promote_plan_portal_email_templates"
  get "my401k/plan_sponsor/promote_plan_portal/banners" => "My401k::PlanSponsor::PromotePlanPortal#banners", as: "plan_sponsor_promote_plan_portal_banners"
  get "my401k/plan_sponsor/promote_plan_portal/letters" => "My401k::PlanSponsor::PromotePlanPortal#letters", as: "plan_sponsor_promote_plan_portal_letters"
  get "my401k/plan_sponsor/promote_plan_portal/videos" => "My401k::PlanSponsor::PromotePlanPortal#videos", as: "plan_sponsor_promote_plan_portal_videos"
  get "my401k/plan_sponsor/promote_plan_portal/enrollment_support" => "My401k::PlanSponsor::PromotePlanPortal#enrollment_support", as: "plan_sponsor_promote_plan_portal_enrollment_support"
  
  ### Plan Sponsor - Manage Content
  match "/my401k/plan_sponsor/manage_content" => redirect("/my401k/plan_sponsor/manage_content/published_content")
  match "/my401k/plan_sponsor/manage_content/index" => redirect("/my401k/plan_sponsor/manage_content/published_content")
  get "my401k/plan_sponsor/manage_content/published_content" => "My401k::PlanSponsor::ManageContent#published_content", as: "plan_sponsor_manage_content_published_content"
  get "my401k/plan_sponsor/manage_content/draft_content" => "My401k::PlanSponsor::ManageContent#draft_content", as: "plan_sponsor_manage_content_draft_content"
  get "my401k/plan_sponsor/manage_content/plugin_content_store" => "My401k::PlanSponsor::ManageContent#plugin_content_store", as: "plan_sponsor_manage_content_plugin_content_store"
  get "my401k/plan_sponsor/manage_content/quick_links" => "My401k::PlanSponsor::ManageContent#quick_links", as: "plan_sponsor_manage_content_quick_links"
  get "my401k/plan_sponsor/manage_content/emergency_message" => "My401k::PlanSponsor::ManageContent#emergency_message", as: "plan_sponsor_manage_content_emergency_message"

  ### Plan Sponsor - Professional Help
  match "/my401k/plan_sponsor/professional_help" => redirect("/my401k/plan_sponsor/professional_help/index")
  get "my401k/plan_sponsor/professional_help/index" => "My401k::PlanSponsor::ProfessionalHelp#index"

  ### Plan Sponsor - Create New Content
  match "/my401k/plan_sponsor/create_new_content" => redirect("/my401k/plan_sponsor/create_new_content/select_section")
  match "/my401k/plan_sponsor/create_new_content/index" => redirect("/my401k/plan_sponsor/create_new_content/select_section")
  get "my401k/plan_sponsor/create_new_content/select_section" => "My401k::PlanSponsor::CreateNewContent#select_section", as: "plan_sponsor_create_new_content_select_section"
  get "my401k/plan_sponsor/create_new_content/select_layout" => "My401k::PlanSponsor::CreateNewContent#select_layout", as: "plan_sponsor_create_new_content_select_layout"
  get "my401k/plan_sponsor/create_new_content/create_title_and_body" => "My401k::PlanSponsor::CreateNewContent#create_title_and_body", as: "plan_sponsor_create_new_content_create_title_and_body"
  get "my401k/plan_sponsor/create_new_content/create_tile" => "My401k::PlanSponsor::CreateNewContent#create_tile", as: "plan_sponsor_create_new_content_create_tile"
  get "my401k/plan_sponsor/create_new_content/optional_elections" => "My401k::PlanSponsor::CreateNewContent#optional_elections", as: "plan_sponsor_create_new_content_optional_elections"
  get "my401k/plan_sponsor/create_new_content/point_content" => "My401k::PlanSponsor::CreateNewContent#point_content", as: "plan_sponsor_create_new_content_point_content"
  get "my401k/plan_sponsor/create_new_content/preview_page" => "My401k::PlanSponsor::CreateNewContent#preview_page", as: "plan_sponsor_create_new_content_preview_page"
  get "my401k/plan_sponsor/create_new_content/next_product_id" => "My401k::PlanSponsor::CreateNewContent#next_product_id", as: "plan_sponsor_create_new_content_next_product_id"

  ### Plan Sponsor - Manage Profile
  match "/my401k/plan_sponsor/manage_profile" => redirect("/my401k/plan_sponsor/manage_profile/basic_information")
  match "/my401k/plan_sponsor/manage_profile/index" => redirect("/my401k/plan_sponsor/manage_profile/basic_information")
  get "my401k/plan_sponsor/manage_profile/basic_information" => "My401k::PlanSponsor::ManageProfile#basic_information", as: "plan_sponsor_manage_profile_basic_information"
  get "my401k/plan_sponsor/manage_profile/admin_delegates" => "My401k::PlanSponsor::ManageProfile#admin_delegates", as: "plan_sponsor_manage_profile_admin_delegates"
  get "my401k/plan_sponsor/manage_profile/portal_branding" => "My401k::PlanSponsor::ManageProfile#portal_branding", as: "plan_sponsor_manage_profile_portal_branding"
  get "my401k/plan_sponsor/manage_profile/participant_access_control" => "My401k::PlanSponsor::ManageProfile#participant_access_control", as: "plan_sponsor_manage_profile_participant_access_control"
  get "my401k/plan_sponsor/manage_profile/subscription_status" => "My401k::PlanSponsor::ManageProfile#subscription_status", as: "plan_sponsor_manage_profile_subscription_status"
  get "my401k/plan_sponsor/manage_profile/sponsor_contacts" => "My401k::PlanSponsor::ManageProfile#sponsor_contacts", as: "plan_sponsor_manage_profile_sponsor_contacts"
  get "my401k/plan_sponsor/manage_profile/alert_preferences" => "My401k::PlanSponsor::ManageProfile#alert_preferences", as: "plan_sponsor_manage_profile_alert_preferences"


  ### Plan Participant - top nav
  match "/my401k/plan_participant" => redirect("/my401k/plan_participant/show_all_re_about_plan")
  get "my401k/plan_participant/show_all_re_about_plan" => "My401k::PlanParticipant#show_all_re_about_plan", as: "plan_participant_about_plan"
  get "my401k/plan_participant/show_all_re_manage_account" => "My401k::PlanParticipant#show_all_re_manage_account", as: "plan_participant_manage_account"
  get "my401k/plan_participant/show_all_re_helpful_resources" => "My401k::PlanParticipant#show_all_re_helpful_resources", as: "plan_participant_helpful_resources"
  get "my401k/plan_participant/show_all_re_blog" => "My401k::PlanParticipant#show_all_re_blog", as: "plan_participant_blog"
  get "my401k/plan_participant/show_all_re_special_offers" => "My401k::PlanParticipant#show_all_re_special_offers", as: "plan_participant_special_offers"
  get "my401k/plan_participant/show_article" => "My401k::PlanParticipant#show_article", as: "plan_participant_show_article"
  get "my401k/plan_participant/show_blog_post" => "My401k::PlanParticipant#show_blog_post", as: "plan_participant_show_blog_post"

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  mount_bcms_my401k
  mount_bcms_blog
  mount_browsercms
end

BcmsMy401k::Engine.routes.draw do
  # TODO: need to figure out why this is getting called twice during start up
  # check if routes were already drawn before drawing them again
  if(BcmsMy401k::Engine.routes.named_routes.names.length == 0)
    content_blocks :layouts
    content_blocks :articles
  end
end


