class Team < ActiveRecord::Base
  belongs_to :series

  has_many :rosters
  has_many :players, through: :rosters

  belongs_to :captain, class_name: 'Player'

  validates :series_id, presence: true
  validates :name, uniqueness: { scope: :series_id }, presence: true
end
