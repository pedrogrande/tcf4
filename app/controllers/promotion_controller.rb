class PromotionController < ApplicationController
	skip_before_action :authenticate_user!
	layout 'public'

  def index
  	@popular_programmes = PopularProgramme.order_by_price
  	@popular_programme = PopularProgramme.find_by(slug: 'rails-foundations-for-beginners')
  	@next_programme = @popular_programme.weekend_programmes.future_by_date_ascending.first
  end
end
