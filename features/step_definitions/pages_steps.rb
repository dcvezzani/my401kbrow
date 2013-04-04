When /^asdf/ do
  # silence_stream(STDOUT) do
  #   load File.join(File.dirname(__FILE__), '../../db/seeds.rb')
  # end
  debugger
  x=3-1
end

Given(/^I am a xguest$/) do
  visit '/cms/logout'
  debugger
  x=3-1
end

And /^login as a plan sponsor$/ do
  fill_in 'login', :with => "cmsadmin"
  fill_in 'password', :with => "cmsadmin"
  click_button 'LOGIN'
end

When /^I examine the page/ do
end

Given(/^I am using the "(.*?)" site$/) do |arg1|
  @site = create(:site, :path => arg1.downcase, :identifier => arg1.downcase, :name => arg1, domain: "www.example.com")
end

When(/^a user who is not logged in visits "(.*?)"$/) do |arg1|
  visit '/cms/logout'
  visit arg1
end

Then(/^the radio button associated with "(.*?)" should be checked$/) do |arg1|
  page.should have_css "#{arg1} input[type='radio'][checked='checked']"
end

Then(/^"(.*?)" should have a circle drawn around it$/) do |arg1|
  page.should have_css "##{arg1} .drawn-circle"
end

Then(/^there should only be one drawn circle at a time on the page$/) do
  page.all(".drawn-circle").count.should == 1
end

Then(/^there should be a drawn circle around item "(.*?)"$/) do |arg1|
  within(arg1) do
    page.should have_css('.drawn-circle')
  end
end

Then(/^an article in progress should exist in the database$/) do
  BcmsMy401k::Article.count.should == 1
end

Then(/^(\d+) articles in progress should exist in the database$/) do |arg1|
  BcmsMy401k::Article.count.should == arg1.to_i
end

Given /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

Then(/^I click on item "(.*?)"$/) do |arg1|
  page.find(:css, arg1).click
end

And(/^I click on "([^\"]+)" on the active tab$/) do |arg1|
  page.find(:css, ".tab-pane.active a:contains('#{arg1}')").click
end

Then(/^there should only be one drawn circle at a time on the active tab$/) do
  page.all("#tab2.tab-pane.active .drawn-circle").count.should == 1
end
