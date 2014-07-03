class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_payment, only: :show
  layout 'public', only: :new

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    if params[:enrolment]
      @enrolment = Enrolment.find_by(guid: params[:enrolment])
      @weekend_programme = @enrolment.weekend_programme
      @popular_programme = @weekend_programme.popular_programme
      @special = @enrolment.special
    end
  end

  # GET /payments/1/edit
  # def edit
  # end

  # POST /payments
  # POST /payments.json
  def create
    enrolment = Enrolment.find_by!(guid: params[:guid])
    amount = params[:amount].to_i
    if amount > 0
      token = params[:stripeToken]

      stripe_customer = Stripe::Customer.create(
        :card => token,
        :description => enrolment.popular_programme.name
      )

      begin
        charge = Stripe::Charge.create(
          amount:   amount, 
          currency:   "aud",
          customer:   stripe_customer.id
        )
        @payment = Payment.credit_card_payment(amount)
        enrolment.update_attributes(stripe_id: stripe_customer.id, payment_id: @payment.id)
        Special.has_been_redeemed(enrolment) if enrolment.special_id
        if session[:ref]
          referrer = session[:ref]
          ReferrerEnrolmentJob.new.async(enrolment.id, referrer)
        end
        # PointsTransaction.enrolment_points(enrolment)
        
        # PurchaseMailer.response(purchase, amount).deliver
        redirect_to thanks_enrolment_path(enrolment)
      rescue Stripe::CardError => e
        # The card has been declined or
        # some other error has occured
        @error = e
        render :new
      end
    else
      @payment = Payment.credit_card_payment(amount)
      enrolment.update_attributes(payment_id: @payment.id)
      Special.has_been_redeemed(enrolment) if enrolment.special_id
      redirect_to thanks_enrolment_path(enrolment)
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  # def update
  #   respond_to do |format|
  #     if @payment.update(payment_params)
  #       format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @payment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @payment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /payments/1
  # # DELETE /payments/1.json
  # def destroy
  #   @payment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to payments_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def payment_params
  #     params.require(:payment).permit(:payment_method, :payment_price, :credit_points_purchased, :user_id, :payment_received)
  #   end
end
