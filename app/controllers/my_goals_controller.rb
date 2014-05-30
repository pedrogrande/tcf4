class MyGoalsController < ApplicationController
  layout 'public'
  def index
  	@goals = Goal.all
  	if current_user
      @user = current_user
  		@user_goals = @user.user_goals
  	else
      @user = guest_user
  		@user_goals = @user.guest_user_goals
    end
  end
end
