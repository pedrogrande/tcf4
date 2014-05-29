class DashboardController < ApplicationController
  layout 'public'
  def index
  	@user = current_user
  	@profile = @user.profile
  	@programme = @user.programmes.last
    @credit_point_packs = CreditPointPack.available.order_by_price
    @user_skills = @user.user_skills.order_by_skill_level
  end
end
