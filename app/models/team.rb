class Team < ActiveRecord::Base
  belongs_to :series

  has_many :rosters
  has_many :players, through: :rosters
  has_many :lineups
  has_many :games
  has_many :goals

  belongs_to :captain, class_name: 'Player'

  validates :name, uniqueness: { scope: :series_id }, presence: true

  def available_players
    (self.players + Player.reserves).uniq
  end
end
