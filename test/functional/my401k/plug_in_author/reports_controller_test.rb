require 'test_helper'

class My401k::PlugInAuthor::ReportsControllerTest < ActionController::TestCase
  test "should get report_001" do
    get :report_001
    assert_response :success
  end

  test "should get report_002" do
    get :report_002
    assert_response :success
  end

  test "should get report_003" do
    get :report_003
    assert_response :success
  end

  test "should get report_004" do
    get :report_004
    assert_response :success
  end

end
