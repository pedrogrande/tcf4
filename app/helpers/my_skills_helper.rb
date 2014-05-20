module MySkillsHelper
	def button(user_skill, level)
		if user_skill.skill_level == level
			'btn btn-primary center-block btn-xs'
		else
			'btn btn-default center-block btn-xs'
		end
	end
end
