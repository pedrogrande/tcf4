class Event < ActiveRecord::Base
  belongs_to :location

  def self.events_this_week
  	where('date >= ? and date < ?', Date.today, Date.today + 7).order(date: :asc)
  end

  def self.events_next_week
  	where('date >= ? and date < ?', Date.today + 7, Date.today + 14).order(date: :asc)
  end
end
