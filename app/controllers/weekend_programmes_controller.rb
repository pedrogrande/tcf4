class WeekendProgrammesController < ApplicationController
  before_action :set_weekend_programme, only: [:show, :edit, :update, :destroy]

  # GET /weekend_programmes
  # GET /weekend_programmes.json
  def index
    @weekend_programmes = WeekendProgramme.future_by_date_ascending
    @past_programmes = WeekendProgramme.past_programmes
    @cancelled_programmes = WeekendProgramme.inactive
  end

  # GET /weekend_programmes/1
  # GET /weekend_programmes/1.json
  def show
  end

  # GET /weekend_programmes/new
  def new
    @weekend_programme = WeekendProgramme.new
  end

  # GET /weekend_programmes/1/edit
  def edit
  end

  # POST /weekend_programmes
  # POST /weekend_programmes.json
  def create
    @weekend_programme = WeekendProgramme.new(weekend_programme_params)

    respond_to do |format|
      if @weekend_programme.save
        format.html { redirect_to @weekend_programme, notice: 'Weekend programme was successfully created.' }
        format.json { render :show, status: :created, location: @weekend_programme }
      else
        format.html { render :new }
        format.json { render json: @weekend_programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekend_programmes/1
  # PATCH/PUT /weekend_programmes/1.json
  def update
    respond_to do |format|
      if @weekend_programme.update(weekend_programme_params)
        format.html { redirect_to @weekend_programme, notice: 'Weekend programme was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekend_programme }
      else
        format.html { render :edit }
        format.json { render json: @weekend_programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekend_programmes/1
  # DELETE /weekend_programmes/1.json
  def destroy
    @weekend_programme.destroy
    respond_to do |format|
      format.html { redirect_to weekend_programmes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekend_programme
      @weekend_programme = WeekendProgramme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekend_programme_params
      params.require(:weekend_programme).permit(:active, :end_date, :popular_programme_id, :location_id, :day, :date, :start_time, :end_time, :number_of_places, :number_of_students_registered)
    end
end
