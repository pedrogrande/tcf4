class ThanksController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'public'
  impressionist
  def index
  end
end
