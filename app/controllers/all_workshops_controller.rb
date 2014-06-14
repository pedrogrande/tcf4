class AllWorkshopsController < ApplicationController
  layout 'public'
  def index
		@goals = Goal.all
		@menu_skill_groups = SkillGroup.all
	  @skill_levels = SkillLevel.all
		if params[:skill_group]
			@skill_group = SkillGroup.friendly.find(params[:skill_group])
			@units = @skill_group.units
	    @title = @skill_group.name + ' workshops'
		# elsif params[:goal]
		# 	@goal = Goal.friendly.find(params[:goal])
		# 	@units = @goal.units
	 #    @title = @goal.name + ' workshops'
	  elsif params[:skill_level]
	  	@skill_level = SkillLevel.find(params[:skill_level])
	  	@units = Unit.where(skill_level: @skill_level.number)
		else
			@units = Unit.active
	    @title = 'All Workshops'
		end
  end
end
