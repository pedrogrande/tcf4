class AboutController < ApplicationController
	skip_before_action :authenticate_user!
	layout 'public'
	impressionist
  def index
  	@profiles = Profile.all
  end
end
