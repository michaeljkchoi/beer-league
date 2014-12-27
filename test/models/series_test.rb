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
end
