require 'find'

namespace :my401k do

  # desc 'Override db:install to include demo seed data.'
  # task :install => ["db:create", "db:migrate", "db:seed", 'db:seed_demo_site']

  desc 'Generate left-side-menu given an audience and topic'
  # task :left_side_menu => 'db:abort_if_pending_migrations' do
  task :left_side_menu do

####### left-side-menu #####################

raise "please provide a AUDIENCE; e.g., AUDIENCE=plan_sponsor"
raise "please provide a TOPIC; e.g., TOPIC=promote_plan_portal"

audience = ENV['AUDIENCE'] or "plug_in_author"
sub_topic = ENV['TOPIC']
sub_topic = "reports"
sub_topic_class = "My401k::PlugInAuthor::Reports"
actions = %w{report_001 report_002 report_003 report_004}

#sub_topic = "manage_content/bundles"
sub_topic_underscore = sub_topic.gsub(/[\/]/, "_")
sub_topic_dashed = sub_topic.gsub(/[_\/]/, "-")
#sub_topic_class = sub_topic.gsub(/[_\/]/, " ").titleize.gsub(/ +/, "")
#sub_topic_class = "My401k::PlugInAuthor::ManageContent::Bundles"
sub_topic_label = sub_topic.gsub(/[_\/]/, " ").titleize
audience_label = audience.gsub(/[_\/]/, " ").titleize


route = <<-EOL
  get "my401k/#{audience}/#{sub_topic}/__entry__" => "#{sub_topic_class}#__entry__", as: "#{audience}_#{sub_topic_underscore}___entry__"
EOL
route.strip!
#puts [sub_topic, sub_topic_underscore, sub_topic_dashed, sub_topic_class, route].map{|x| "'#{x}'"}
puts [sub_topic, sub_topic_underscore, sub_topic_dashed, sub_topic_class, route].map{|x| ">> #{x}"}
#puts [sub_topic, sub_topic_underscore, sub_topic_dashed, sub_topic_class, route]

#actions = %w{}
#actions = %w{move_to_bundle destroy publishuire 'minitest/autorun'class TestCashRegister < MiniTest::Unit::TestCase  def setup    @register = CashRegister.new  end  def test_default_is_zero    assert_equal 0, @register.total  endenduirequire 'minitest/autorun'class TestCashRegister < MiniTest::Unit::TestCase  def setup    @register = CashRegister.new  end  def test_default_is_zero    assert_equal 0, @register.total  endendplan_sponsored drafted product_summary_by_all_types product_summary_by_type product_summary_by_all_categories product_summary_by_category details_summaries details_summary details_product publish clone_draft move_to_draft edit destroy search filter help}
routes = actions.map do |entry|
  route.gsub(/__entry__/, entry.gsub(/-/, "_"))
end
puts routes.map{|x| ">> #{x}"}

#actions = %w{move_to_bundle destroy published drafted product_summary_by_all_types product_summary_by_type product_summary_by_all_categories product_summary_by_category details_summaries details_summary details_product publish clone_draft move_to_draft edit destroy search filter help}

first_action = actions.first.gsub(/-/, "_")
redirects = <<-EOL
match "/my401k/#{audience}/#{sub_topic}" => redirect("/my401k/#{audience}/#{sub_topic}/#{first_action}")
  match "/my401k/#{audience}/#{sub_topic}/index" => redirect("/my401k/#{audience}/#{sub_topic}/#{first_action}")
EOL
redirects.strip!

out = []
out << "  " + ["### #{audience_label} - #{sub_topic_label}", redirects].concat(routes).join("\n  ")
puts out.last


menu = <<-EOL
      <dd>
        <div class="redSideButton">
          <%= link_to #{audience}_#{sub_topic_underscore}___entry_dash___path, class: "nav-label" do %>
            <img class="grayBarImg" src="<%= asset_path 'buttonBarImgs/red-wide-button.png' %>">
            <p class="redButtonText">__entry_cap__</p>
          <% end %>
        </div><!-- /.redSideButon -->
      </dd>
EOL
menu.strip!

#menu_actions = %w{published drafted}
menu_actions = actions
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

out << menu
puts out.last

file_name = "generate-menus-#{Time.now.strftime("%Y%m%d%H%M%S")}.txt"
File.open(file_name, "w"){|f| f.write out.join("\n\n") }

`mvim -p ./#{file_name} ./config/routes.rb ./app/views/layouts/my401k/plug_in_author/promote_plug_ins.html.erb ./app/views/layouts/my401k/#{audience}/#{sub_topic}.html.erb ./app/controllers/my401k/plug_in_author/promote_plug_ins_controller.rb ./app/controllers/my401k/#{audience}/#{sub_topic}_controller.rb`
    
  end
  
end





