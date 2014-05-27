class WeekendProgramme < ActiveRecord::Base
  belongs_to :popular_programme
  belongs_to :location
  has_many :enrolments

  def self.future_programmes
  	where('date > ?', Date.today)
  end

  def self.future_by_date_ascending
  	self.future_programmes.order(date: :asc)
  end
end
