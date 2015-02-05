class Goal < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :scorer, class_name: 'Player', foreign_key: 'scorer_id'
  belongs_to :primary_assister, class_name: 'Player', foreign_key: 'primary_assister_id'
  belongs_to :secondary_assister, class_name: 'Player', foreign_key: 'secondary_assister_id'

  validates :game_id, presence: true
  validates :team_id, presence: true
  validates :scorer_id, presence: true
  validates :category, presence: true
end
