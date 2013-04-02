When /^blah$/ do
  debugger
  x=3-1
end

Given(/^I am a xguest$/) do
  visit '/cms/logout'
  debugger
  x=3-1
end

Given(/^I am using the "(.*?)" site$/) do |arg1|
  @site = create(:site, :path => arg1.downcase, :identifier => arg1.downcase, :name => arg1, domain: "www.example.com")
end

When(/^a user who is not logged in visits "(.*?)"$/) do |arg1|
  visit '/cms/logout'
  visit arg1
end

Then(/^they should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end

When(/^clicks on "(.*?)"$/) do |arg1|
  click_link "#{arg1}"
end

Then(/^the radio button associated with "(.*?)" should be checked$/) do |arg1|
  page.should have_css "##{arg1} input[type='radio'][checked='checked']"
end
