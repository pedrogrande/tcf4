class GuestUsersController < ApplicationController
	def update
		@guest_user = GuestUser.find(params[:id])
		if @guest_user.update(guest_user_params)
			@programme = Programme.find(@guest_user.programme_id)
			if User.where(email: guest_user.email).count > 0
				@user = User.where(email: guest_user.email).first
			else
	  		generated_password = Devise.friendly_token.first(8)
				@user = User.create!(email: guest_user.email, password: generated_password)
				@user.save
				@guest_user.user = @user
			end
			@user.programmes << @programme
			if @guest_user.enrolled
				@user.add_role(:applicant)
			else
				@user.add_role(:prospect)
			end
			if @user.user_skills.count == 0
				@guest_user.guest_user_skills.each do |guest_user_skill|
					user_skill = UserSkill.new
					user_skill.skill = guest_user_skill.skill
					user_skill.skill_level = guest_user_skill.skill_level
					user_skill.user = @user
					user_skill.save
				end
			end
			if @user.goals.count == 0
				@guest_user.goals.each do |goal|
					user_goal = UserGoal.new
					user_goal.goal = goal
					user_goal.user = @user
					user_goal.save
				end
			end
			sign_in(:user, @user)
			if Profile.where(user_id: @user.id).count > 0
				redirect_to profile_path(@user.profile)
			else
				# TODO: send welcome email
				@profile = Profile.new
				@profile.name = @guest_user.name
				@profile.user = @user
				# need to do something with this points addition
				@user.points_table = PointsTable.new
				@user.points_table.add_received_points(5) if @guest_user.enrolled
				@profile.save
				redirect_to @profile
			end
		else
			redirect_to :back
		end
	end

	private
	def guest_user_params
		params.require(:guest_user).permit(:email, :name, :programme_id, :phone, :converted, :enrolled)
	end
end