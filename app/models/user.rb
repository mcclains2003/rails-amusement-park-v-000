class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      return "happy" if mood > 0
      "sad"
    end
  end

end