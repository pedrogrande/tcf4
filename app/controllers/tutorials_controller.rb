class TutorialsController < ApplicationController
  layout 'public'
  def index
  	@posts = Post.all
  end
end
