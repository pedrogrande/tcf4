class WeekendProgramme < ActiveRecord::Base
  belongs_to :popular_programme
  belongs_to :location
  has_many :enrolments
  has_many :specials

  def adjust_student_numbers
    update_attributes(
      number_of_places: number_of_places.to_i - 1,
      number_of_students_registered: number_of_students_registered.to_i + 1
    )
  end

  def self.active
    where(active: true)
  end

  def self.future_programmes
    active.where('date >= ?', Date.today)
  end

  def self.future_by_date_ascending
    future_programmes.order(date: :asc)
  end

  def self.cancelled
    active.where('active = ? or active = ?', nil, false)
  end

  def self.past_programmes
    where('date <= ?', Date.today)
  end

  def self.next_three_programmes
    future_by_date_ascending.limit(3)
  end
end