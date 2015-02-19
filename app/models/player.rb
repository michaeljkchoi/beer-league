class Player < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  validates :first_name, :last_name, :email, presence: true

  has_many :rosters
  has_many :teams, through: :rosters
  has_many :series, through: :teams

  has_many :lineups, dependent: :destroy
  has_many :games, through: :lineups
  has_many :goals

  def full_name
    [self.first_name, self.last_name].reject(&:blank?).join(' ')
  end

  def slug_candidates
    [
      :full_name,
      [:full_name, :number]
    ]
  end

  def self.reserves
    where(reserve: true)
  end

  def get_lineup(game)
    existing_lineup = self.lineups.find_by(game_id: game.id)
    if existing_lineup.present?
      existing_lineup
    else
      self.lineups.build
    end
  end
end
