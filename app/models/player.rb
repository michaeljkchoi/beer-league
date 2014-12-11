class Player < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :finders]
  validates :first_name, :last_name, :email, presence: true

  def full_name
    [self.first_name, self.last_name].reject(&:blank?).join(' ')
  end
end
