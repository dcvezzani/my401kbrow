require 'test_helper'

class My401k::PlugInAuthor::ManageContent::PublishedBundlesControllerTest < ActionController::TestCase
  test "should get published" do
    get :published
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
