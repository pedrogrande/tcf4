class AllCoursesController < ApplicationController
  def index
  	@goals = Goal.all
  	if params[:skill_group]
  		@skill_group = SkillGroup.friendly.find(params[:skill_group])
  		@units = @skill_group.units
      @title = @skill_group.name + ' modules'
  	elsif params[:goal]
  		@goal = Goal.friendly.find(params[:goal])
  		@units = @goal.units
      @title = @goal.name + ' modules'
  	else
  		@units = Unit.active
      @title = 'All Modules'
  	end
  end
end
