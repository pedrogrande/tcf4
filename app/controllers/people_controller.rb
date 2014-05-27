class PeopleController < ApplicationController
  layout 'public'
  def index
  	@staff = User.staff
  end
end
