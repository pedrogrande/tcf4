class Event < ActiveRecord::Base
  belongs_to :location
<<<<<<< HEAD
  extend FriendlyId
  friendly_id :name, use: :slugged
  require 'icalendar'
  require 'icalendar/tzinfo'

  after_create :create_invite
  after_update :create_invite

  def create_invite
    cal = Icalendar::Calendar.new
    event = Icalendar::Event.new  
    event.dtstart = DateTime.new(date.year, date.month, date.day, start_time.hour, start_time.min, start_time.sec)
    event.dtend = DateTime.new(date.year, date.month, date.day, end_time.hour, end_time.min, end_time.sec)
    event.summary = name        
    event.description = tagline   
    event.location = location.street + ', ' + location.suburb        
    cal.add_event(event)
		update_attributes(calendar_invite: cal.to_ical)
  end
=======
>>>>>>> parent of e51e713... fixed error in css

  def self.events_this_week
  	where('date >= ? and date < ?', Date.today, Date.today + 7).order(date: :asc)
  end

  def self.events_next_week
  	where('date >= ? and date < ?', Date.today + 7, Date.today + 14).order(date: :asc)
  end
end
