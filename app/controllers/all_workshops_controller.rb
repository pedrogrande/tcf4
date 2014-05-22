class AllWorkshopsController < ApplicationController
  def index
		@goals = Goal.all
		if params[:skill_group]
			@skill_group = SkillGroup.friendly.find(params[:skill_group])
			@units = @skill_group.units
	    @title = @skill_group.name + ' workshops'
		elsif params[:goal]
			@goal = Goal.friendly.find(params[:goal])
			@units = @goal.units
	    @title = @goal.name + ' workshops'
		else
			@units = Unit.active
	    @title = 'All Workshops'
		end
  end
end
