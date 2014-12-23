class Team < ActiveRecord::Base
  has_many :rosters
  has_many :players, through: :rosters
end
