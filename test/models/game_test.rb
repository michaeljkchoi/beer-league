require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'valid game' do
    game = Game.new(
      series_id: series(:twentyfourteen).id,
      home_team_id: teams(:toronto).id,
      away_team_id: teams(:pittsburgh).id
    )
    assert game.save, 'Valid game was not saved'
    assert_equal teams(:toronto), game.home_team
    assert_equal teams(:pittsburgh), game.away_team
  end

  test 'invalid game' do
    game = Game.new()
    assert_not game.save, 'Invalid game saved'
    assert_equal "can't be blank", game.errors[:home_team].join(', '), 'No error for game without a home team'
    assert_equal "can't be blank", game.errors[:away_team].join(', '), 'No error for game without a away team'
  end
end
