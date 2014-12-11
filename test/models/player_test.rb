require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'player saved with all parameters' do
    player = Player.new(
      first_name: 'Michael',
      last_name: 'Choi',
      email: 'mchoi@beerleague.com'
    )
    assert player.save, 'Valid player was not saved'
  end

  test 'default reserve attribute is false' do
    player = Player.create(
      first_name: 'Michael',
      last_name: 'Choi',
      email: 'mchoi@beerleague.com'
    )
    assert_equal player.reserve, false, 'Default reserve attribute is incorrect'
  end

  test 'player not saved without first name' do
    player = Player.new(last_name: 'Choi', email: 'mchoi@beerleague.com')
    assert_not player.save, 'Player without first name was saved'
  end

  test 'player not saved without last name' do
    player = Player.new(first_name: 'Michael', email: 'mchoi@beerleague.com')
    assert_not player.save, 'Player without last name was saved'
  end

  test 'should not save player without email' do
    player = Player.new(first_name: 'Michael', last_name: 'Choi')
    assert_not player.save, 'Player without email was saved'
  end
end
