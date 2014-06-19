class ReferralVisitsController < ApplicationController
  before_action :set_referral_visit, only: [:show, :edit, :update, :destroy]

  # GET /referral_visits
  # GET /referral_visits.json
  def index
    @referral_visits = ReferralVisit.all
  end

  # GET /referral_visits/1
  # GET /referral_visits/1.json
  def show
  end

  # GET /referral_visits/new
  def new
    @referral_visit = ReferralVisit.new
  end

  # GET /referral_visits/1/edit
  def edit
  end

  # POST /referral_visits
  # POST /referral_visits.json
  def create
    @referral_visit = ReferralVisit.new(referral_visit_params)

    respond_to do |format|
      if @referral_visit.save
        format.html { redirect_to @referral_visit, notice: 'Referral visit was successfully created.' }
        format.json { render :show, status: :created, location: @referral_visit }
      else
        format.html { render :new }
        format.json { render json: @referral_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referral_visits/1
  # PATCH/PUT /referral_visits/1.json
  def update
    respond_to do |format|
      if @referral_visit.update(referral_visit_params)
        format.html { redirect_to @referral_visit, notice: 'Referral visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @referral_visit }
      else
        format.html { render :edit }
        format.json { render json: @referral_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referral_visits/1
  # DELETE /referral_visits/1.json
  def destroy
    @referral_visit.destroy
    respond_to do |format|
      format.html { redirect_to referral_visits_url, notice: 'Referral visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_visit
      @referral_visit = ReferralVisit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referral_visit_params
      params.require(:referral_visit).permit(:referrer_id)
    end
end
