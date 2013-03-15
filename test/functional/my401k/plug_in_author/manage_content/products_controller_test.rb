require 'test_helper'

class My401k::PlugInAuthor::ManageContent::ProductsControllerTest < ActionController::TestCase
  test "should get move_to_bundle" do
    get :move_to_bundle
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get published" do
    get :published
    assert_response :success
  end

  test "should get drafted" do
    get :drafted
    assert_response :success
  end

  test "should get product_summary_by_all_types" do
    get :product_summary_by_all_types
    assert_response :success
  end

  test "should get product_summary_by_type" do
    get :product_summary_by_type
    assert_response :success
  end

  test "should get product_summary_by_all_categories" do
    get :product_summary_by_all_categories
    assert_response :success
  end

  test "should get product_summary_by_category" do
    get :product_summary_by_category
    assert_response :success
  end

  test "should get details_summaries" do
    get :details_summaries
    assert_response :success
  end

  test "should get details_summary" do
    get :details_summary
    assert_response :success
  end

  test "should get details_product" do
    get :details_product
    assert_response :success
  end

  test "should get publish" do
    get :publish
    assert_response :success
  end

  test "should get clone_draft" do
    get :clone_draft
    assert_response :success
  end

  test "should get move_to_draft" do
    get :move_to_draft
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get filter" do
    get :filter
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
