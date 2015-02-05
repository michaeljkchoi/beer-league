class Game < ActiveRecord::Base
  belongs_to :series
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'

  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :date, presence: true

  validate :teams_are_unique, on: [:create, :update]

  def teams_are_unique
    errors.add(:away_team, 'is already the home team') if home_team_id == away_team_id
  end
end
