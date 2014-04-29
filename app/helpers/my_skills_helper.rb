module MySkillsHelper
	def button(user_skill, level)
		if user_skill.skill_level == level
			'btn btn-success'
		else
			'btn btn-default'
		end
	end
end
