require 'test_helper'

class SeriesTest < ActiveSupport::TestCase
  test 'series validation' do
    valid_series = Series.new(
      name: '2013 Season'
    )
    assert valid_series.save, 'Valid series was not saved'

    missing_name = Series.new()
    assert_not missing_name.save, 'Series missing a name was not saved'
  end

  test 'available players method' do
    series = series(:twentyfourteen)
    drafted_player = players(:phaneuf)
    undrafted_player = players(:gretzky)
    available = series.available_players

    assert_equal 1, available.count, 'Available players method does not return the correct set of players'
    assert_not_includes available, drafted_player, 'Available players method includes drafted players'
    assert_includes available, undrafted_player, 'Available players method does not include undrafted players'
    assert_kind_of Array, available, 'Available players method does not return array'
  end
end
