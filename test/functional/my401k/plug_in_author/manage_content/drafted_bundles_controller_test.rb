require 'test_helper'

class My401k::PlugInAuthor::ManageContent::DraftedBundlesControllerTest < ActionController::TestCase
  test "should get drafted" do
    get :drafted
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
