class WeekendProgramme < ActiveRecord::Base
  belongs_to :popular_programme
  belongs_to :location
  has_many :enrolments

  def adjust_student_numbers
  	update_attributes(
  		number_of_places: number_of_places.to_i - 1,
  		number_of_students_registered: number_of_students_registered.to_i + 1
  	)
  end

  def self.future_programmes
  	where('date > ?', Date.today)
  end

  def self.future_by_date_ascending
  	self.future_programmes.order(date: :asc)
  end

  def self.past_programmes
    where('end_date <= ?', Date.today)
  end
end
