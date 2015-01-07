require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @series = series(:twentyfourteen)
    @team = teams(:toronto)
  end

  test "should get index" do
    get :index, series_id: @series.id
    assert_response :success
    assert_not_nil assigns(:teams)
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
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to series_teams_url(assigns(:series))
  end
end
