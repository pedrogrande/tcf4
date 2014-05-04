class AllCoursesController < ApplicationController
  def index
  	@units = Unit.all
  end
end
