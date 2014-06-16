class Event < ActiveRecord::Base
  belongs_to :location
  has_many :event_registrations
  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.future_events
    where('date >= ?', Date.today)
  end

  def self.future_by_date_ascending
    future_events.order(date: :asc)
  end

  def self.next_three_events
  	future_by_date_ascending.limit(3)
  end

end