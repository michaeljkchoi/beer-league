require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'team saved with all parameters' do
    team = Team.new(
      name: 'Pittsburgh Penguins',
      captain: players(:crosby),
      series_id: series(:twentyfourteen).id
    )

    assert team.save, 'Valid team was not saved'
  end

  test 'team is not saved without belonging to a series' do
    team = Team.create(name: 'Ottawa Senators')
    assert_not team.save, 'Team was saved without belonging to a series'
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
