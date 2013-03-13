require 'test_helper'

class My401k::PromotePlanPortalControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get print_material" do
    get :print_material
    assert_response :success
  end

  test "should get email_templates" do
    get :email_templates
    assert_response :success
  end

  test "should get banners" do
    get :banners
    assert_response :success
  end

  test "should get letters" do
    get :letters
    assert_response :success
  end

  test "should get videos" do
    get :videos
    assert_response :success
  end

  test "should get enrollment_support" do
    get :enrollment_support
    assert_response :success
  end

end
