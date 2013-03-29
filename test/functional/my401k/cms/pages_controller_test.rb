require 'test_helper'

class My401k::Cms::PagesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
