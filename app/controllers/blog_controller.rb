class BlogController < ApplicationController
  layout 'public'
  def index
  	@posts = Post.order('id DESC').paginate(:page => params[:page], :per_page => 2)
  	@categories = Category.all
  end
end
