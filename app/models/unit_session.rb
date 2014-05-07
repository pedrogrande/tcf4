class UnitSession < ActiveRecord::Base
  belongs_to :unit
  belongs_to :location

  def self.future_sessions
   	where("date >= ?", Date.today).order(date: :asc)
  end
end
