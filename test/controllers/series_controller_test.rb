require 'test_helper'
include Devise::TestHelpers

class SeriesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @series = series(:twentyfourteen)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:series)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create series" do
    assert_difference('Series.count') do
      post :create, series: {
        name: '2012 Series',
        teams_attributes: {
          team: { name: 'Boston Bruins' },
          team: { name: 'Washington Capitals' }
        }
      }
    end

    assert_redirected_to series_path(assigns(:series))
  end

  test "should show series" do
    get :show, id: @series
    assert_response :success
    assert_select 'h2', @series.name
    assert_equal 2, assigns(:teams).count, '@teams does not return the correct number of teams'
    assert_includes assigns(:teams), teams(:toronto), '@teams does not include a team in the series'
    assert_not_includes assigns(:teams), teams(:vancouver), '@teams includes a team from another series'
  end

  test "should get edit" do
    get :edit, id: @series
    assert_response :success
  end

  test "should update series" do
    patch :update, id: @series, series: {
      name: '2011 Series'
    }
    assert_redirected_to series_path(assigns(:series))
  end

  test "should destroy series" do
    assert_difference('Series.count', -1) do
      delete :destroy, id: @series
    end

    assert_redirected_to series_index_path
  end
end
