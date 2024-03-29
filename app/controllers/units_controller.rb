class UnitsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  layout 'public', only: [:show]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
    @menu_skill_groups = SkillGroup.all
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @popular_programmes = @unit.popular_programmes
    
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:outcome, :objectives, :benefits, :name, :tagline, :description, :duration_minutes, :icon, :skill_group_id, :unit_code, :workshop_credits, :online_credits, :active, :skill_level_id, :tag_list)
    end
end
