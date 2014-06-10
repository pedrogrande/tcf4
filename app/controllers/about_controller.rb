class AboutController < ApplicationController
	skip_before_action :authenticate_user!
	layout 'public'
	impressionist
  def index
  	@profiles = Profile.all
  	@weekend_programme = WeekendProgramme.future_by_date_ascending.first
  	@latest_post = Post.published_in_reverse_chron_order.first
  	@popular_post = Post.popular_posts.first
  end
end
