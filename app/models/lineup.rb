class Lineup < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :team

  validates :player_id, uniqueness: { scope: :game_id }, presence: true

  def player_boolean=(value)
    value == '1'
  end

  def player_boolean
    self.id.present?
  end
end
