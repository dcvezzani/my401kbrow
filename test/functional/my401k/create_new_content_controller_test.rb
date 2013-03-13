require 'test_helper'

class My401k::CreateNewContentControllerTest < ActionController::TestCase
  test "should get select_section" do
    get :select_section
    assert_response :success
  end

  test "should get select_layout" do
    get :select_layout
    assert_response :success
  end

  test "should get create_title_and_body" do
    get :create_title_and_body
    assert_response :success
  end

  test "should get create_tile" do
    get :create_tile
    assert_response :success
  end

  test "should get optional_elections" do
    get :optional_elections
    assert_response :success
  end

  test "should get point_content" do
    get :point_content
    assert_response :success
  end

end
