require 'test_helper'
include Devise::TestHelpers

class GoalsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @goal = goals(:one)
    @game = @goal.game
  end

  test "should get new" do
    get :new, game_id: @game.id
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post :create, goal: {
        scorer_id: players(:crosby).id,
        category: 'ev'
      }, game_id: @game.id
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should get edit" do
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    patch :update, id: @goal, goal: {
      category: 'sh'
    }
    assert_redirected_to game_path(assigns(:goal).game)
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal
    end

    assert_redirected_to game_path(assigns(:goal).game)
  end
end
