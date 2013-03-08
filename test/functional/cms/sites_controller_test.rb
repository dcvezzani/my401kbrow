require 'test_helper'

class Cms::SitesControllerTest < ActionController::TestCase
  setup do
    @cms_site = cms_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cms_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cms_site" do
    assert_difference('Cms::Site.count') do
      post :create, cms_site: { domain: @cms_site.domain, identifier: @cms_site.identifier, locale: @cms_site.locale, name: @cms_site.name, path: @cms_site.path, the_default: @cms_site.the_default }
    end

    assert_redirected_to cms_site_path(assigns(:cms_site))
  end

  test "should show cms_site" do
    get :show, id: @cms_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cms_site
    assert_response :success
  end

  test "should update cms_site" do
    put :update, id: @cms_site, cms_site: { domain: @cms_site.domain, identifier: @cms_site.identifier, locale: @cms_site.locale, name: @cms_site.name, path: @cms_site.path, the_default: @cms_site.the_default }
    assert_redirected_to cms_site_path(assigns(:cms_site))
  end

  test "should destroy cms_site" do
    assert_difference('Cms::Site.count', -1) do
      delete :destroy, id: @cms_site
    end

    assert_redirected_to cms_sites_path
  end
end
