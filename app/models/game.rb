class Game < ActiveRecord::Base
  belongs_to :series
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'

  has_many :lineups, dependent: :destroy
  accepts_nested_attributes_for :lineups, allow_destroy: true, reject_if: :unchecked?
  has_many :players, through: :lineups
  has_many :goals

  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :date, presence: true
  validate :teams_are_unique, on: [:create, :update]

  CATEGORY = {
    ev: 'Even Strength Goal',
    pp: 'Power Play Goal',
    sh: 'Short Handed Goal',
    ps: 'Penalty Shot Goal',
    ot: 'Overtime Goal'
  }

  def teams_are_unique
    errors.add(:away_team, 'is already the home team') if home_team_id == away_team_id
  end

  def game_number
    games = series.games.order(date: :asc)
    return games.index(self) + 1
  end

  def goals_for(team)
    goals.where(team: team).count
  end

  def teams
    [home_team, away_team]
  end

  def unchecked?(attributed)
    attributed['player_boolean'] != '1'
  end
end
