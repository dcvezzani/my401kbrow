require 'test_helper'

class My401k::ProfessionalHelpControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
