require 'test_helper'

class ManageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get register_voter" do
    get :register_voter
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

end
