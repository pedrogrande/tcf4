module MyGoalsHelper
	def goal_not_chosen?(goal)
		if current_user
    	!current_user.user_goals.find_by(goal_id: goal.id)
    else
    	@user = GuestUser.find(session[:guest_user_id])
    	!@user.guest_user_goals.find_by(goal_id: goal.id)
  	end
	end
	def goals_selected(user_goals)
		if user_goals.count > 0
			'btn btn-success pull-right btn-lg'
		else
			'btn btn-success pull-right btn-lg disabled'
		end
	end
end
