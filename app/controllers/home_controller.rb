class HomeController < ApplicationController
  def index
  	@unit_sessions = UnitSession.future_sessions.limit(6)
  end
end
