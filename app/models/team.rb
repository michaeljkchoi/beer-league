class Team < ActiveRecord::Base
  belongs_to :series

  has_many :rosters
  has_many :players, through: :rosters
  has_many :games

  belongs_to :captain, class_name: 'Player'

  validates :name, uniqueness: { scope: :series_id }, presence: true
end
