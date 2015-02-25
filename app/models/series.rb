class Series < ActiveRecord::Base
  validates :name, presence: true

  has_many :teams, dependent: :destroy
  accepts_nested_attributes_for :teams, allow_destroy: true

  has_many :players, through: :teams
  has_many :games

  def available_players
    Player.all - players
  end

  def first_game
    games.first
  end

  def wins_by(team)
    w = 0
    games.where(closed: true).each do |game|
      w += 1 if game.won_by? team
    end
    w
  end
end
