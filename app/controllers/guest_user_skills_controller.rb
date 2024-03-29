class GuestUserSkillsController < ApplicationController
	respond_to :html, :js
	def choose
		@guest_user_skill = GuestUserSkill.find(params[:id])
		@guest_user_skill.update_attribute(:skill_level, params[:skill_level])
    respond_with @guest_user_skill, :location => :my_skills
	end
end