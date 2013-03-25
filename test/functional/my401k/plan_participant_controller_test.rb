require 'test_helper'

class My401k::PlanParticipantControllerTest < ActionController::TestCase
  test "should get show_all_re_about_plan" do
    get :show_all_re_about_plan
    assert_response :success
  end

  test "should get show_all_re_manage_account" do
    get :show_all_re_manage_account
    assert_response :success
  end

  test "should get show_all_re_helpful_resources" do
    get :show_all_re_helpful_resources
    assert_response :success
  end

  test "should get show_all_re_blog" do
    get :show_all_re_blog
    assert_response :success
  end

  test "should get show_all_re_special_offers" do
    get :show_all_re_special_offers
    assert_response :success
  end

  test "should get show_article" do
    get :show_article
    assert_response :success
  end

  test "should get show_blog_post" do
    get :show_blog_post
    assert_response :success
  end

end
