class GuestUserGoalsController < ApplicationController
	def destroy
		@guest_user_goal = GuestUserGoal.find(params[:id])
		@guest_user_goal.destroy
		redirect_to :back
	end
end