require 'test_helper'

class My401k::ManageProfileControllerTest < ActionController::TestCase
  test "should get basic_information" do
    get :basic_information
    assert_response :success
  end

  test "should get admin_delegates" do
    get :admin_delegates
    assert_response :success
  end

  test "should get portal_branding" do
    get :portal_branding
    assert_response :success
  end

  test "should get participant_access_control" do
    get :participant_access_control
    assert_response :success
  end

  test "should get subscription_status" do
    get :subscription_status
    assert_response :success
  end

  test "should get sponsor_contacts" do
    get :sponsor_contacts
    assert_response :success
  end

  test "should get alert_preferences" do
    get :alert_preferences
    assert_response :success
  end

end
