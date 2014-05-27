class ContactController < ApplicationController
  layout 'public'
  def index
  	@enquiry = Enquiry.new
  end
end
