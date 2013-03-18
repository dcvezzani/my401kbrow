require 'test_helper'

class My401k::PlanSponsor::CreateNewContentControllerTest < ActionController::TestCase
  test "should get select_section" do
    get :select_section
    assert_response :success
  end

  test "should get select_layout" do
    get :select_layout
    assert_response :success
  end

  test "should get define_body" do
    get :define_body
    assert_response :success
  end

  test "should get define_tile" do
    get :define_tile
    assert_response :success
  end

  test "should get select_elections" do
    get :select_elections
    assert_response :success
  end

  test "should get save_content" do
    get :save_content
    assert_response :success
  end

  test "should get preview_page" do
    get :preview_page
    assert_response :success
  end

end
