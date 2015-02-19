require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  test 'valid goal' do
    goal = Goal.new(
      game_id: games(:one).id,
      scorer_id: players(:crosby).id,
      primary_assister_id: players(:gretzky).id,
      category: 'SHG'
    )
    assert goal.save
    assert_equal players(:crosby), goal.scorer
    assert_equal players(:gretzky), goal.primary_assister
  end

  test 'invalid goal' do
    goal = Goal.new()
    assert_not goal.save
    assert_includes goal.errors[:game_id], "can't be blank", 'Saved without game id'
    assert_includes goal.errors[:scorer_id], "can't be blank", 'Saved without scorer id'
    assert_includes goal.errors[:category], "can't be blank", 'Saved without category'
  end
end
