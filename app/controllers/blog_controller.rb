class BlogController < ApplicationController
  layout 'public'
  def index
  	@categories = Category.all
  	if params[:tag]
  		@tag = params[:tag]
  		@posts = Post.tagged_with(@tag).published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 10)
  	elsif params[:category]
  		@category = Category.find(params[:category])
  		@posts = @category.posts.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 10)
  	else
  		@posts = Post.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 10)
  	end
  end
end
