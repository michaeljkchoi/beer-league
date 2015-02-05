require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'valid game' do
    game = Game.new(
      series_id: series(:twentyfourteen).id,
      home_team_id: teams(:toronto).id,
      away_team_id: teams(:pittsburgh).id,
      date: Time.zone.now
    )
    assert game.save, 'Valid game was not saved'
    assert_equal teams(:toronto), game.home_team
    assert_equal teams(:pittsburgh), game.away_team
  end

  test 'invalid game' do
    game = Game.new()
    assert_not game.save, 'Invalid game saved'
    assert_includes game.errors[:home_team], "can't be blank"
    assert_includes game.errors[:away_team], "can't be blank"
    assert_includes game.errors[:date], "can't be blank"
  end

  test 'teams are unique validation' do
    game = Game.new(
      series_id: series(:twentyfourteen).id,
      home_team_id: teams(:toronto).id,
      away_team_id: teams(:toronto).id,
      date: Time.zone.now
    )
    assert_not game.save
    assert_includes game.errors[:away_team], "is already the home team"
  end
end
