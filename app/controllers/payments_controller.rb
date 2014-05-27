class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
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
    @user = current_user
    @purchase = Purchase.find_by!(guid: params[:guid])
    @credit_point_packs = CreditPointPack.available.order_by_price
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    purchase = Purchase.find_by!(guid: params[:guid])
      amount = params[:amount]
      token = params[:stripeToken]

      stripe_customer = Stripe::Customer.create(
        :card => token,
        :description => purchase.user.profile.name
      )

      begin
        charge = Stripe::Charge.create(
          amount:   amount, 
          currency:   "aud",
          customer:   stripe_customer.id
        )
        @payment = Payment.credit_card_payment(purchase, amount)
        purchase.update_attributes(stripe_id: stripe_customer.id, payment_id: @payment.id)
        PointsTransaction.purchase_points(purchase)
        
        # PurchaseMailer.response(purchase, amount).deliver
        redirect_to dashboard_path
      rescue Stripe::CardError => e
        # The card has been declined or
        # some other error has occured
        @error = e
        render :new
      end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:payment_method, :payment_price, :credit_points_purchased, :user_id, :payment_received)
    end
end
