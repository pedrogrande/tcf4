class BlogController < ApplicationController
  layout 'public'
  def index
  	@posts = Post.all
  end
end
