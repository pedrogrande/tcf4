class EventRegistrationThanksController < ApplicationController
	skip_before_action :authenticate_user!
	layout 'public'
  def index
  	@post = Post.published_in_reverse_chron_order.popular_posts.first
  end
end
