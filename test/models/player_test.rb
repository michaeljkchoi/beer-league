require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'valid player' do
    player = Player.new(
      first_name: 'Michael',
      last_name: 'Choi',
      email: 'mchoi@beerleague.com'
    )
    assert player.save, 'Valid player was not saved'
    assert_equal false, player.reserve, 'Default reserve attribute is incorrect'
    assert_equal 'Michael Choi', player.full_name
  end

  test 'invalid player' do
    player = Player.new()
    assert_not player.save, 'Invalid player saved'
    assert_includes player.errors[:first_name], "can't be blank"
    assert_includes player.errors[:last_name], "can't be blank"
    assert_includes player.errors[:email], "can't be blank"
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

  test 'slug appends number if duplicate' do
    impostor = Player.create(
      first_name: players(:crosby).first_name,
      last_name: players(:crosby).last_name,
      email: players(:crosby).email,
      number: 88
    )
    assert_not_equal players(:crosby).slug, impostor.slug, 'Slugs must be unique'
    assert_match /88\z/, impostor.slug, 'Impostor number was not appended to slug'
  end

  test 'slug is unique' do
    impostor = Player.create(
      first_name: players(:crosby).first_name,
      last_name: players(:crosby).last_name,
      email: players(:crosby).email
    )
    assert_not_equal players(:crosby).slug, impostor.slug, 'Slugs must be unique'
  end

  test 'reserves class method' do
    reserves = Player.reserves

    assert_equal 1, reserves.count
    assert_includes reserves, players(:gretzky)
  end

  test "position instance method" do
    player = players(:crosby)
    assert_equal "player", player.position

    goalie = players(:bernier)
    assert_equal "goalie", goalie.position
  end
end
