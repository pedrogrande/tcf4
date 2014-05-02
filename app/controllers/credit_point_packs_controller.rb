class CreditPointPacksController < ApplicationController
  before_action :set_credit_point_pack, only: [:show, :edit, :update, :destroy]

  # GET /credit_point_packs
  # GET /credit_point_packs.json
  def index
    @credit_point_packs = CreditPointPack.order_by_price
  end

  # GET /credit_point_packs/1
  # GET /credit_point_packs/1.json
  def show
  end

  # GET /credit_point_packs/new
  def new
    @credit_point_pack = CreditPointPack.new
  end

  # GET /credit_point_packs/1/edit
  def edit
  end

  # POST /credit_point_packs
  # POST /credit_point_packs.json
  def create
    @credit_point_pack = CreditPointPack.new(credit_point_pack_params)

    respond_to do |format|
      if @credit_point_pack.save
        format.html { redirect_to @credit_point_pack, notice: 'Credit point pack was successfully created.' }
        format.json { render :show, status: :created, location: @credit_point_pack }
      else
        format.html { render :new }
        format.json { render json: @credit_point_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_point_packs/1
  # PATCH/PUT /credit_point_packs/1.json
  def update
    respond_to do |format|
      if @credit_point_pack.update(credit_point_pack_params)
        format.html { redirect_to @credit_point_pack, notice: 'Credit point pack was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_point_pack }
      else
        format.html { render :edit }
        format.json { render json: @credit_point_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_point_packs/1
  # DELETE /credit_point_packs/1.json
  def destroy
    @credit_point_pack.destroy
    respond_to do |format|
      format.html { redirect_to credit_point_packs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_point_pack
      @credit_point_pack = CreditPointPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_point_pack_params
      params.require(:credit_point_pack).permit(:name, :number_of_points, :price, :available)
    end
end
