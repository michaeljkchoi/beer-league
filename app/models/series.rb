class Series < ActiveRecord::Base
  validates :name, presence: true

  has_many :teams, dependent: :destroy
  accepts_nested_attributes_for :teams, allow_destroy: true

  has_many :players, through: :teams

  def available_players
    Player.all - players
  end
end
