class MySkillsController < ApplicationController
  def index
    @guest_user_goals = guest_user.goals
    if guest_user.skills.count == 0
    	@guest_user_goals.each do |guest_user_goal|
    		guest_user_goal.skills.each do |skill|
	    		# guest_user_skill = GuestUserSkill.new
	    		GuestUserSkill.create(guest_user: guest_user, skill: skill, skill_level: 0).save
	    	end
	    end
	  end
	  @guest_user_skills = guest_user.guest_user_skills
    @skills
  end
end
