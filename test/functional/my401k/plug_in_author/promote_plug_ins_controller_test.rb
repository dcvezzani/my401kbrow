require 'test_helper'

class My401k::PlugInAuthor::PromotePlugInsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
