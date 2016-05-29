require 'test_helper'

class VoteControllerTest < ActionController::TestCase
  test "should get vote" do
    get :vote
    assert_response :success
  end

  test "should get register_vote" do
    get :register_vote
    assert_response :success
  end

  test "should get thanks" do
    get :thanks
    assert_response :success
  end

end
