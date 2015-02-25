require 'test_helper'
include Devise::TestHelpers

class TeamsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @series = series(:twentyfourteen)
    @team = teams(:toronto)
  end

  test "should get index" do
    get :index, series_id: @series.id
    assert_response :success
    assert_not_nil assigns(:teams)
    assert_equal 2, assigns(:teams).count, '@teams does not return the correct number of teams'
    assert_includes assigns(:teams), teams(:toronto), '@teams does not include a team in the series'
    assert_not_includes assigns(:teams), teams(:vancouver), '@teams includes a team from another series'
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team, team: {
      name: 'Vancouver Canucks'
    }
    assert_redirected_to series_path(assigns(:team).series)
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end
    assert_redirected_to series_teams_url(assigns(:series))
  end
end
