class HomeController < ApplicationController
  skip_before_action :authenticate_user!
	impressionist
	layout 'public'
  def index
  	# @unit_sessions = UnitSession.future_sessions.limit(6)
  	# @weekend_programmes = WeekendProgramme.future_by_date_ascending
  	@next_three_events = Event.next_three_events
  	@next_three_programmes = WeekendProgramme.next_three_programmes
    @featured_testimonials = Testimonial.featured.limit(3)
  end
end