class PointsTransactionsController < ApplicationController
  before_action :set_points_transaction, only: [:show, :edit, :update, :destroy]

  # GET /points_transactions
  # GET /points_transactions.json
  def index
    @points_transactions = PointsTransaction.all
  end

  # GET /points_transactions/1
  # GET /points_transactions/1.json
  def show
  end

  # GET /points_transactions/new
  def new
    @points_transaction = PointsTransaction.new
  end

  # GET /points_transactions/1/edit
  def edit
  end

  # POST /points_transactions
  # POST /points_transactions.json
  def create
    @points_transaction = PointsTransaction.new(points_transaction_params)

    respond_to do |format|
      if @points_transaction.save
        format.html { redirect_to @points_transaction, notice: 'Points transaction was successfully created.' }
        format.json { render :show, status: :created, location: @points_transaction }
      else
        format.html { render :new }
        format.json { render json: @points_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points_transactions/1
  # PATCH/PUT /points_transactions/1.json
  def update
    respond_to do |format|
      if @points_transaction.update(points_transaction_params)
        format.html { redirect_to @points_transaction, notice: 'Points transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @points_transaction }
      else
        format.html { render :edit }
        format.json { render json: @points_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_transactions/1
  # DELETE /points_transactions/1.json
  def destroy
    @points_transaction.destroy
    respond_to do |format|
      format.html { redirect_to points_transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_points_transaction
      @points_transaction = PointsTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def points_transaction_params
      params.require(:points_transaction).permit(:user_id, :transaction_type, :number_of_points, :value_of_points, :notes, :approval_required, :approval_received, :admin_id)
    end
end
