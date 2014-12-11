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
    assert_equal false, player.reserve, 'Default reserve attribute is incorrect'
  end

  test 'full name is correct' do
    player = players(:crosby)
    assert_equal 'Sidney Crosby', player.full_name, 'Full name method is incorrect'
  end

  test 'slug is correct' do
    player = Player.create(
      first_name: 'Michael',
      last_name: 'Choi',
      email: 'mchoi@beerleague.com'
    )
    assert_match /#{ player.first_name }/i, player.slug, 'First name is missing in slug'
    assert_match /#{ player.last_name }/i, player.slug, 'Last name is missing in slug'
  end

  test 'slug is unique' do
    impostor = Player.create(
      first_name: players(:crosby).first_name,
      last_name: players(:crosby).last_name,
      email: players(:crosby).email
    )
    assert_not_equal players(:crosby).slug, impostor.slug, 'Slugs must be unique'
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
