class PopularProgrammesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_popular_programme, only: [:show, :edit, :update, :destroy]
  layout 'public', only: [:show]
  impressionist :actions=>[:show]

  # GET /popular_programmes
  # GET /popular_programmes.json
  def index
    @popular_programmes = PopularProgramme.all
  end

  # GET /popular_programmes/1
  # GET /popular_programmes/1.json
  def show
    @units = @popular_programme.units.order_by_skill_level
    @popular_programmes = PopularProgramme.order_by_price
    @weekend_programmes = @popular_programme.weekend_programmes.future_by_date_ascending
    @next_programme = @weekend_programmes.first
    @banner = Banner.active.last
    @enrolment = Enrolment.new
  end

  # GET /popular_programmes/new
  def new
    @popular_programme = PopularProgramme.new
  end

  # GET /popular_programmes/1/edit
  def edit
  end

  # POST /popular_programmes
  # POST /popular_programmes.json
  def create
    @popular_programme = PopularProgramme.new(popular_programme_params)
    @popular_programme.total_points = @popular_programme.units.sum(:workshop_credits)
    @popular_programme.credit_point_pack = CreditPointPack.best_option(@popular_programme.total_points)

    respond_to do |format|
      if @popular_programme.save
        format.html { redirect_to @popular_programme, notice: 'Popular programme was successfully created.' }
        format.json { render :show, status: :created, location: @popular_programme }
      else
        format.html { render :new }
        format.json { render json: @popular_programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /popular_programmes/1
  # PATCH/PUT /popular_programmes/1.json
  def update

    respond_to do |format|
      if @popular_programme.update(popular_programme_params)
        format.html { redirect_to @popular_programme, notice: 'Popular programme was successfully updated.' }
        format.json { render :show, status: :ok, location: @popular_programme }
      else
        format.html { render :edit }
        format.json { render json: @popular_programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /popular_programmes/1
  # DELETE /popular_programmes/1.json
  def destroy
    @popular_programme.destroy
    respond_to do |format|
      format.html { redirect_to popular_programmes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_popular_programme
      @popular_programme = PopularProgramme.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def popular_programme_params
      params.require(:popular_programme).permit(:intro, :icon, :price, :name, :image, :tagline, :description, :total_points, :credit_point_pack_id, :unit_ids => [])
      
    end

end
