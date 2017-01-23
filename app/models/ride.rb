class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough && enough_tickets
      self.user.update(tickets: update_tickets,
                       happiness: update_happiness,
                       nausea: update_nausea
                       )
      "Thanks for riding the #{self.attraction.name}!"
    elsif !tall_enough && enough_tickets
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end

  end

  def tall_enough
    self.user.height >= self.attraction.min_height
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def update_tickets
    self.user.tickets - self.attraction.tickets
  end

  def update_happiness
    self.user.happiness + self.attraction.happiness_rating
  end

  def update_nausea
    self.user.nausea + self.attraction.nausea_rating
  end

end
