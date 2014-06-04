class EnrolmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :thanks]
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]
  layout 'public', only: [:new, :edit, :thanks]
  impressionist :actions=>[:new]
  # GET /enrolments
  # GET /enrolments.json
  def index
    @enrolments = Enrolment.reverse_order
  end

  def thanks
    @enrolment = Enrolment.find(params[:id])
  end
  # GET /enrolments/1
  # GET /enrolments/1.json
  def show
  end

  # GET /enrolments/new
  def new
    @enrolment = Enrolment.new
    if params[:intake]
      @weekend_programme = WeekendProgramme.find(params[:intake]) 
    end
  end

  # GET /enrolments/1/edit
  def edit
  end

  # POST /enrolments
  # POST /enrolments.json
  def create
    @enrolment = Enrolment.new(enrolment_params)

    respond_to do |format|
      if @enrolment.save
        format.html { redirect_to new_payment_path(enrolment: @enrolment.guid) }
        format.json { render :show, status: :created, location: @enrolment }
      else
        format.html { render :new }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolments/1
  # PATCH/PUT /enrolments/1.json
  def update
    respond_to do |format|
      if @enrolment.update(enrolment_params)
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrolment }
      else
        format.html { render :edit }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolments/1
  # DELETE /enrolments/1.json
  def destroy
    @enrolment.destroy
    respond_to do |format|
      format.html { redirect_to enrolments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolment
      @enrolment = Enrolment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrolment_params
      params.require(:enrolment).permit(:about, :first_name, :last_name, :phone, :email, :address, :suburb, :state, :postcode, :country, :popular_programme_id, :weekend_programme_id, :paid)
    end
end
