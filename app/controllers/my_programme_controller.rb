class MyProgrammeController < ApplicationController
  def index
  	@programme = Programme.find(params[:programme])
  	@units = Unit.all

  	@user = guest_user
  end
end
