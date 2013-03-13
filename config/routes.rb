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

  match "/my401k/admin/promote_plan_portal" => redirect("/my401k/admin/promote_plan_portal/print_material")
  match "/my401k/admin/promote_plan_portal/index" => redirect("/my401k/admin/promote_plan_portal/print_material")
  get "my401k/admin/promote_plan_portal/print_material" => "My401k::PromotePlanPortal#print_material"
  get "my401k/admin/promote_plan_portal/email_templates" => "My401k::PromotePlanPortal#email_templates"
  get "my401k/admin/promote_plan_portal/banners" => "My401k::PromotePlanPortal#banners"
  get "my401k/admin/promote_plan_portal/letters" => "My401k::PromotePlanPortal#letters"
  get "my401k/admin/promote_plan_portal/videos" => "My401k::PromotePlanPortal#videos"
  get "my401k/admin/promote_plan_portal/enrollment_support" => "My401k::PromotePlanPortal#enrollment_support"

  match "/my401k/admin/manage_content" => redirect("/my401k/admin/manage_content/published_content")
  match "/my401k/admin/manage_content/index" => redirect("/my401k/admin/manage_content/published_content")
  get "my401k/admin/manage_content/published_content" => "My401k::ManageContent#published_content"
  get "my401k/admin/manage_content/draft_content" => "My401k::ManageContent#draft_content"
  get "my401k/admin/manage_content/plugin_content_store" => "My401k::ManageContent#plugin_content_store"
  get "my401k/admin/manage_content/quick_links" => "My401k::ManageContent#quick_links"
  get "my401k/admin/manage_content/emergency_message" => "My401k::ManageContent#emergency_message"

  match "/my401k/admin/professional_help" => redirect("/my401k/admin/professional_help/index")
  get "my401k/admin/professional_help/index" => "My401k::ProfessionalHellp#index"

  match "/my401k/admin/create_new_content" => redirect("/my401k/admin/create_new_content/select_section")
  match "/my401k/admin/create_new_content/index" => redirect("/my401k/admin/create_new_content/select_section")
  get "my401k/admin/create_new_content/select_section" => "My401k::CreateNewContent#select_section"
  get "my401k/admin/create_new_content/select_layout" => "My401k::CreateNewContent#select_layout"
  get "my401k/admin/create_new_content/create_title_and_body" => "My401k::CreateNewContent#create_title_and_body"
  get "my401k/admin/create_new_content/create_tile" => "My401k::CreateNewContent#create_tile"
  get "my401k/admin/create_new_content/optional_elections" => "My401k::CreateNewContent#optional_elections"
  get "my401k/admin/create_new_content/point_content" => "My401k::CreateNewContent#point_content"

  match "/my401k/admin/manage_profile" => redirect("/my401k/admin/manage_profile/basic_information")
  match "/my401k/admin/manage_profile/index" => redirect("/my401k/admin/manage_profile/basic_information")
  get "my401k/admin/manage_profile/basic_information" => "My401k::ManageProfile#basic_information"
  get "my401k/admin/manage_profile/admin_delegates" => "My401k::ManageProfile#admin_delegates"
  get "my401k/admin/manage_profile/portal_branding" => "My401k::ManageProfile#portal_branding"
  get "my401k/admin/manage_profile/participant_access_control" => "My401k::ManageProfile#participant_access_control"
  get "my401k/admin/manage_profile/subscription_status" => "My401k::ManageProfile#subscription_status"
  get "my401k/admin/manage_profile/sponsor_contacts" => "My401k::ManageProfile#sponsor_contacts"
  get "my401k/admin/manage_profile/alert_preferences" => "My401k::ManageProfile#alert_preferences"
  
  mount_bcms_blog

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

  mount_browsercms
end
