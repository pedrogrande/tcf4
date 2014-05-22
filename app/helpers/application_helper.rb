module ApplicationHelper
	def profile_percentage(user)
		
	end

	def formatted_price(amount)
    sprintf("$%0.2f", amount / 100.0)
  end

	def skill_level_name(level_number)
		if level_number == 0
			'None'
		elsif level_number == 1
			'Beginner'
		elsif level_number == 2
			'Experienced'
		elsif level_number == 3
			'Advanced'
		elsif level_number == 5
			'Expert'
		elsif level_number == 4
			'Almost expert'
		end
	end

	def panel_color(skill_group)
		if skill_group.name == 'Web Design'
			'info'
		elsif skill_group.name == 'Programming Skills'
			'warning'
		end
			
	end

	def box_color(skill_group)
		if skill_group.name == 'Web Design'
			'orange'
		elsif skill_group.name == 'Programming Skills'
			'green'
		end
			
	end

	def skill_label(skill_level)
		if skill_level == 1
			'warning'
		elsif skill_level == 2
			'info'
		elsif skill_level == 3
			'primary'
		elsif skill_level == 5
			'success'
		end
	end
end
