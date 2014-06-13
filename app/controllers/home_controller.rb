class HomeController < ApplicationController
  skip_before_action :authenticate_user!
	impressionist
	layout 'public'
  def index
  	# @unit_sessions = UnitSession.future_sessions.limit(6)
  	# @weekend_programmes = WeekendProgramme.future_by_date_ascending
  	@events_this_week = Event.events_this_week
  	@events_next_week = Event.events_next_week
  	@programmes_this_week = WeekendProgramme.programmes_this_week
  	@programmes_next_week = WeekendProgramme.programmes_next_week
  end
end
