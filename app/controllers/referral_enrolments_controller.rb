class ReferralEnrolmentsController < ApplicationController
  before_action :set_referral_enrolment, only: [:show, :edit, :update, :destroy]

  # GET /referral_enrolments
  # GET /referral_enrolments.json
  def index
    @referral_enrolments = ReferralEnrolment.all
  end

  # GET /referral_enrolments/1
  # GET /referral_enrolments/1.json
  def show
  end

  # GET /referral_enrolments/new
  def new
    @referral_enrolment = ReferralEnrolment.new
  end

  # GET /referral_enrolments/1/edit
  def edit
  end

  # POST /referral_enrolments
  # POST /referral_enrolments.json
  def create
    @referral_enrolment = ReferralEnrolment.new(referral_enrolment_params)

    respond_to do |format|
      if @referral_enrolment.save
        format.html { redirect_to @referral_enrolment, notice: 'Referral enrolment was successfully created.' }
        format.json { render :show, status: :created, location: @referral_enrolment }
      else
        format.html { render :new }
        format.json { render json: @referral_enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referral_enrolments/1
  # PATCH/PUT /referral_enrolments/1.json
  def update
    respond_to do |format|
      if @referral_enrolment.update(referral_enrolment_params)
        format.html { redirect_to @referral_enrolment, notice: 'Referral enrolment was successfully updated.' }
        format.json { render :show, status: :ok, location: @referral_enrolment }
      else
        format.html { render :edit }
        format.json { render json: @referral_enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referral_enrolments/1
  # DELETE /referral_enrolments/1.json
  def destroy
    @referral_enrolment.destroy
    respond_to do |format|
      format.html { redirect_to referral_enrolments_url, notice: 'Referral enrolment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_enrolment
      @referral_enrolment = ReferralEnrolment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referral_enrolment_params
      params.require(:referral_enrolment).permit(:referrer_id, :enrolment_id, :student_paid, :amount_owed, :date_paid)
    end
end
