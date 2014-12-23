class Player < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  validates :first_name, :last_name, :email, presence: true

  has_many :rosters
  has_many :teams, through: :rosters

  def full_name
    [self.first_name, self.last_name].reject(&:blank?).join(' ')
  end

  def slug_candidates
    [
      :full_name,
      [:full_name, :number]
    ]
  end
end
