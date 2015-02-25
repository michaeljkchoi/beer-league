require 'test_helper'
include Devise::TestHelpers

class GamesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @game = games(:one)
    @series = @game.series
  end

  test "should get new" do
    get :new, series_id: @series.id
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: {
        series_id: @series.id,
        date: Time.zone.now,
        home_team_id: teams(:toronto).id,
        away_team_id: teams(:vancouver).id
      }, series_id: @series.id
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: {
      away_team_id: teams(:vancouver).id
    }
    assert_equal 'Vancouver Canucks', assigns(:game).away_team.name
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to series_games_path(@series)
  end
end
