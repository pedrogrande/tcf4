class PeopleController < ApplicationController
  def index
  	@staff = User.staff
  end
end
