class MyProgrammesController < ApplicationController
  def index
  	@programme = Programme.find(params[:programme])
  	@units = Unit.all
  	@recommended_units = @units
  	@user = guest_user
  end

  def new
    @guest_user = guest_user
    @unit = Unit.find(params[:unit])
    if !@guest_user.programme
      @programme = Programme.new
    	@programme.guest_user = @guest_user
    	@programme.units << @unit
      @programme.save
    else
      @programme = @guest_user.programme
      if !@programme.units.include?(@unit)
        @programme.units << @unit
      end
    end
    @units = Unit.all
    @recommended_units = @units
  end
end
