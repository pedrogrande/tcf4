module ApplicationHelper
	def profile_percentage(user)
		
	end

	def skill_level(level_number)
		if level_number == 0
			'None'
		elsif level_number == 1
			'Beginner'
		elsif level_number == 2
			'Intermediate'
		elsif level_number == 3
			'Experienced'
		end
	end

	def panel_color(skill_group)
		if skill_group.name == 'Web Design'
			'info'
		elsif skill_group.name == 'Programming Skills'
			'warning'
		end
			
	end
end
