require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'should not save player without first name' do
    player = Player.new(
      last_name: players(:crosby).last_name,
      number: players(:crosby).number,
      email: players(:crosby).email,
      phone_number: players(:crosby).phone_number
    )
    assert_not player.save, 'Saved player without first name'
  end

  test 'should not save player without last name' do
    player = Player.new(
      first_name: players(:crosby).first_name,
      number: players(:crosby).number,
      email: players(:crosby).email,
      phone_number: players(:crosby).phone_number
    )
    assert_not player.save, 'Saved player without last name'
  end

  test 'should not save player without email' do
    player = Player.new(
      first_name: players(:crosby).first_name,
      last_name: players(:crosby).last_name,
      number: players(:crosby).number,
      phone_number: players(:crosby).phone_number
    )
    assert_not player.save, 'Saved player without email'
  end
end
