if(ENV["BROWSERCMS_PATH"])
  require "#{ENV["BROWSERCMS_PATH"]}/test/support/factory_helpers"
  include FactoryHelpers

  # FactoryGirl.define do
  #   factory :site, :class => Cms::Site do |s|
  #     s.name "My Site"
  #     s.domain "ABC"
  #     s.identifier "abc"
  #     s.path "abc"
  #   end
  # end
end
