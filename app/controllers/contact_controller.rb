class ContactController < ApplicationController
	skip_before_action :authenticate_user!
  layout 'public'
  impressionist
  def index
  	@enquiry = Enquiry.new
  end
end
