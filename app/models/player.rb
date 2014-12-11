class Player < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
