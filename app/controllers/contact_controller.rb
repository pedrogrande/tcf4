class ContactController < ApplicationController
  layout 'public'
  impressionist
  def index
  	@enquiry = Enquiry.new
  end
end
