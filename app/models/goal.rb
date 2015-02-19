class Goal < ActiveRecord::Base
  before_save :assign_team

  belongs_to :game
  belongs_to :team
  belongs_to :scorer, class_name: 'Player', foreign_key: 'scorer_id'
  belongs_to :primary_assister, class_name: 'Player', foreign_key: 'primary_assister_id'
  belongs_to :secondary_assister, class_name: 'Player', foreign_key: 'secondary_assister_id'

  validates :game_id, presence: true
  validates :scorer_id, presence: true
  validates :category, presence: true

  def assign_team
    self.team_id = scorer.lineups.find_by(game_id: game_id).team_id
  end
end
