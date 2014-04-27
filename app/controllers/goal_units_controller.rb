class GoalUnitsController < ApplicationController
  before_action :set_goal_unit, only: [:show, :edit, :update, :destroy]

  # GET /goal_units
  # GET /goal_units.json
  def index
    @goal_units = GoalUnit.all
  end

  # GET /goal_units/1
  # GET /goal_units/1.json
  def show
  end

  # GET /goal_units/new
  def new
    @goal_unit = GoalUnit.new
  end

  # GET /goal_units/1/edit
  def edit
  end

  # POST /goal_units
  # POST /goal_units.json
  def create
    @goal_unit = GoalUnit.new(goal_unit_params)

    respond_to do |format|
      if @goal_unit.save
        format.html { redirect_to @goal_unit, notice: 'Goal unit was successfully created.' }
        format.json { render :show, status: :created, location: @goal_unit }
      else
        format.html { render :new }
        format.json { render json: @goal_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_units/1
  # PATCH/PUT /goal_units/1.json
  def update
    respond_to do |format|
      if @goal_unit.update(goal_unit_params)
        format.html { redirect_to @goal_unit, notice: 'Goal unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_unit }
      else
        format.html { render :edit }
        format.json { render json: @goal_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_units/1
  # DELETE /goal_units/1.json
  def destroy
    @goal_unit.destroy
    respond_to do |format|
      format.html { redirect_to goal_units_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_unit
      @goal_unit = GoalUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_unit_params
      params.require(:goal_unit).permit(:unit_id, :goal_id)
    end
end
