class HomeController < ApplicationController
  def index
  	# @unit_sessions = UnitSession.future_sessions.limit(6)
  	@weekend_programmes = WeekendProgramme.future_by_date_ascending
  end
end
