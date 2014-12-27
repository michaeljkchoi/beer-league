require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'team validations' do
    valid_team = Team.new(
      name: 'Calgary Flames',
      captain: players(:phaneuf),
      series_id: series(:twentyfourteen).id
    )
    assert valid_team.save, 'Valid team was not saved'

    missing_name = Team.new(
      series_id: series(:twentyfourteen).id
    )
    assert_not missing_name.save, 'Team without a name was not saved'

    missing_series = Team.create(name: 'Ottawa Senators')
    assert_not missing_series.save, 'Team was saved without belonging to a series'
  end

  test 'team name is unique for the series' do
    bad = Team.create(
      name: teams(:toronto).name,
      series_id: teams(:toronto).series_id
    )
    assert_not bad.save, 'Invalid (duplicate) team name was saved'

    good = Team.create(
      name: teams(:toronto).name,
      series_id: series(:twentyfifteen).id
    )
    assert good.save, 'Valid (duplicate) team name was not saved'
  end
end
