class MyProgrammesController < ApplicationController
  layout 'public'
  def index
  	@programme = Programme.find(params[:programme])
  	@units = Unit.all
  	@recommended_units = @units
  	@user = guest_user
  end

  def new
    @guest_user = guest_user
    if params[:popular_programme]
      @popular_programme = PopularProgramme.find(params[:popular_programme])
    end
    if params[:location]
      @location = Location.find(params[:location])
    end
    if !@guest_user.programme
      @programme = Programme.new
    	@programme.guest_user = @guest_user
      if params[:unit]
        @unit = Unit.find(params[:unit])
      	@programme.units << @unit
      elsif @popular_programme
        @popular_programme.units.each do |unit|
          @programme.units << unit
        end
      end
      @programme.save
    else
      @programme = @guest_user.programme
      if params[:unit]
        @unit = Unit.find(params[:unit])
        if !@programme.units.include?(@unit)
          @programme.units << @unit
        end
      elsif @popular_programme
        @popular_programme.units.each do |unit|
          if !@programme.units.include?(unit)
            @programme.units << unit
          end
        end
      end
      @programme.save
    end
    @units = Unit.all
    @recommended_units = @units
  end
end
