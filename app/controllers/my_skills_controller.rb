class MySkillsController < ApplicationController
  def index
    @skill_groups = SkillGroup.all
    if current_user
      if current_user.user_skills.count < 1
        @skills = Skill.all
        @skills.each do |skill|
          UserSkill.create(user: current_user, skill: skill, skill_level: 0).save
        end
      end
      @user_skills = current_user.user_skills
    else
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
    end
  end
end
