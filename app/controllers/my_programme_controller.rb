class MyProgrammeController < ApplicationController
  def index
  	@programme = Programme.find(params[:programme])
  	@units = Unit.all
  	@recommended_units = @units
  	@user = guest_user
  end
end
