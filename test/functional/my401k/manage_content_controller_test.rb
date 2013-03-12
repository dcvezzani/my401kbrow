require 'test_helper'

class My401k::ManageContentControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get published_content" do
    get :published_content
    assert_response :success
  end

  test "should get draft_content" do
    get :draft_content
    assert_response :success
  end

  test "should get plugin_content_store" do
    get :plugin_content_store
    assert_response :success
  end

  test "should get quick_links" do
    get :quick_links
    assert_response :success
  end

  test "should get emergency_message" do
    get :emergency_message
    assert_response :success
  end

end
