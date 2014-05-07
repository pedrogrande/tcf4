class AllCoursesController < ApplicationController
  def index
  	@goals = Goal.all
  	if params[:skill_group]
  		@skill_group = SkillGroup.friendly.find(params[:skill_group])
  		@units = @skill_group.units
  	elsif params[:goal]
  		@goal = Goal.friendly.find(params[:goal])
  		@units = @goal.units
  	else
  		@units = Unit.active
  	end
  end
end
