class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout 'public', only: :show
  require 'csv'

  def export
    @posts = Post.all
    posts_csv = CSV.generate do |csv|
      csv << ["Title", "Lead", "Content", "Image", "Slug", "Published Date", "Impressions Count"]
      @posts.each do |post|
        csv << [post.lead, post.content, post.image, post.slug, post.published_date, post.impressions_count]
      end
    end
    send_data(posts_csv, :type => 'text/csv', :filename => 'all_posts.csv')
   end
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.reverse_chron_order
    @categories = Category.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = @post.user
    @profile = @user.profile
    impressionist(@post, @post.title)
    @posts = Post.limit(3).order('id DESC')
    @categories = Category.all
    @popular_posts = Post.popular_posts.limit(3)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:published_date, :title, :tag_list, :lead, :content, :image, :publish, :user_id, :slug, :category_id)
    end
end
