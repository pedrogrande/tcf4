class PrivacyController < ApplicationController
	skip_before_action :authenticate_user!
	layout 'public'
  def index
  end
end
