raise "this script must be run manually with care"

####### left-side-menu #####################

sub_topic = "manage_content/bundles"
sub_topic_underscore = sub_topic.gsub(/[\/]/, "_")
sub_topic_dashed = sub_topic.gsub(/[_\/]/, "-")
sub_topic_class = sub_topic.gsub(/[_\/]/, " ").titleize.gsub(/ +/, "")
sub_topic_class = "My401k::PlugInAuthor::ManageContent::Bundles"

route = <<-EOL
  get "my401k/plug_in_author/#{sub_topic}/__entry__" => "#{sub_topic_class}#__entry__", as: "plug_in_author_#{sub_topic_underscore}___entry__"
EOL
route.strip!
#puts [sub_topic, sub_topic_underscore, sub_topic_dashed, sub_topic_class, route].map{|x| "'#{x}'"}
puts [sub_topic, sub_topic_underscore, sub_topic_dashed, sub_topic_class, route].map{|x| ">> #{x}"}
#puts [sub_topic, sub_topic_underscore, sub_topic_dashed, sub_topic_class, route]

#actions = %w{}
actions = %w{move_to_bundle destroy published drafted product_summary_by_all_types product_summary_by_type product_summary_by_all_categories product_summary_by_category details_summaries details_summary details_product publish clone_draft move_to_draft edit destroy search filter help}
routes = actions.map do |entry|
  route.gsub(/__entry__/, entry.gsub(/-/, "_"))
end
puts routes.map{|x| ">> #{x}"}

actions = %w{move_to_bundle destroy published drafted product_summary_by_all_types product_summary_by_type product_summary_by_all_categories product_summary_by_category details_summaries details_summary details_product publish clone_draft move_to_draft edit destroy search filter help}

first_action = actions.first.gsub(/-/, "_")
redirects = <<-EOL
match "/my401k/plug_in_author/#{sub_topic}" => redirect("/my401k/plug_in_author/#{sub_topic}/#{first_action}")
  match "/my401k/plug_in_author/#{sub_topic}/index" => redirect("/my401k/plug_in_author/#{sub_topic}/#{first_action}")
EOL
redirects.strip!

sub_topic_label = sub_topic.gsub(/[_\/]/, " ").titleize

puts "  " + ["### #{sub_topic_label}", redirects].concat(routes).join("\n  ")


menu = <<-EOL
      <dd>
        <div class="redSideButton">
          <%= link_to plug_in_author_#{sub_topic_underscore}___entry_dash___path, class: "nav-label" do %>
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">__entry_cap__</p>
          <% end %>
        </div><!-- /.redSideButon -->
      </dd>
EOL
menu.strip!

menu_actions = %w{published drafted}
menu_entries = menu_actions.map do |entry|
  new_menu = menu.gsub(/__entry__/, entry)
  new_menu.gsub!(/__entry_dash__/, entry.gsub(/-/, "_"))
  new_menu.gsub(/__entry_cap__/, entry.gsub(/-/, " ").titleize)
end

menu = <<-EOL
  <dl>
    <dt>#{sub_topic_label} Menu</dt>
      #{menu_entries.join("\n        ")}
  </dl>
EOL

puts menu


  match "/my401k/admin/promote_plan_portal" => redirect("/my401k/admin/promote_plan_portal/print_material")
  match "/my401k/admin/promote_plan_portal/index" => redirect("/my401k/admin/promote_plan_portal/print_material")
  get "my401k/admin/promote_plan_portal/print_material" => "My401k::PromotePlanPortal#print_material"


  <dl>
    <dt>Manage Profile Menu</dt>
      <dd>
        <div class="redSideButton">
          <a href="#">
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Basic Information</p>
          </a>
        </div><!-- /.redSideButon -->
      </dd>
      <dd>
      <div class="redSideButton">

          <%= link_to plan_provider_admin_delegates_path do %>
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Admin Delegates</p>
          <% end %>
          
        </div><!-- /.redSideButon -->
      </dd>
      <dd>
        <div class="redSideButton">
          <a href="#">
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Portal Branding</p>
          </a>
        </div><!-- /.redSideButon -->
      </dd>
      <dd>
        <div class="redSideButton">
          <a href="#">
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Part. Access Control</p>
          </a>
        </div><!-- /.redSideButon -->
      </dd>
      <dd>
        <div class="redSideButton">
          <a href="#">
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Subscription Status</p>
          </a>
        </div><!-- /.redSideButon -->
      </dd>
      <dd>
        <div class="redSideButton">
          <a href="#">
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Sponsor Contacts</p>
          </a>
        </div><!-- /.redSideButon -->
      </dd>
      <dd>
        <div class="redSideButton">
          <a href="#">
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">Alert Preferences</p>
          </a>
        </div><!-- /.redSideButon -->
      </dd>
  </dl>




rm -rf app/assets/javascripts/my401k/plug_in_author/manage_content/ app/assets/stylesheets/my401k/plug_in_author/manage_content/ app/controllers/my401k/plug_in_author/manage_content/ app/helpers/my401k/plug_in_author/manage_content/ app/views/my401k/plug_in_author/manage_content/ test/functional/my401k/plug_in_author/manage_content/ test/unit/helpers/my401k/plug_in_author/manage_content/
