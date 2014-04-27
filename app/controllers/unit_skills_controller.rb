class UnitSkillsController < ApplicationController
  before_action :set_unit_skill, only: [:show, :edit, :update, :destroy]

  # GET /unit_skills
  # GET /unit_skills.json
  def index
    @unit_skills = UnitSkill.all
  end

  # GET /unit_skills/1
  # GET /unit_skills/1.json
  def show
  end

  # GET /unit_skills/new
  def new
    @unit_skill = UnitSkill.new
  end

  # GET /unit_skills/1/edit
  def edit
  end

  # POST /unit_skills
  # POST /unit_skills.json
  def create
    @unit_skill = UnitSkill.new(unit_skill_params)

    respond_to do |format|
      if @unit_skill.save
        format.html { redirect_to @unit_skill, notice: 'Unit skill was successfully created.' }
        format.json { render :show, status: :created, location: @unit_skill }
      else
        format.html { render :new }
        format.json { render json: @unit_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_skills/1
  # PATCH/PUT /unit_skills/1.json
  def update
    respond_to do |format|
      if @unit_skill.update(unit_skill_params)
        format.html { redirect_to @unit_skill, notice: 'Unit skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_skill }
      else
        format.html { render :edit }
        format.json { render json: @unit_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_skills/1
  # DELETE /unit_skills/1.json
  def destroy
    @unit_skill.destroy
    respond_to do |format|
      format.html { redirect_to unit_skills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_skill
      @unit_skill = UnitSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_skill_params
      params.require(:unit_skill).permit(:unit_id, :skill_id, :before_skill_level, :after_skill_level)
    end
end
