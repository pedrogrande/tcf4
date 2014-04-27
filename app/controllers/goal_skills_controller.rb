class GoalSkillsController < ApplicationController
  before_action :set_goal_skill, only: [:show, :edit, :update, :destroy]

  # GET /goal_skills
  # GET /goal_skills.json
  def index
    @goal_skills = GoalSkill.all
  end

  # GET /goal_skills/1
  # GET /goal_skills/1.json
  def show
  end

  # GET /goal_skills/new
  def new
    @goal_skill = GoalSkill.new
  end

  # GET /goal_skills/1/edit
  def edit
  end

  # POST /goal_skills
  # POST /goal_skills.json
  def create
    @goal_skill = GoalSkill.new(goal_skill_params)

    respond_to do |format|
      if @goal_skill.save
        format.html { redirect_to @goal_skill, notice: 'Goal skill was successfully created.' }
        format.json { render :show, status: :created, location: @goal_skill }
      else
        format.html { render :new }
        format.json { render json: @goal_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_skills/1
  # PATCH/PUT /goal_skills/1.json
  def update
    respond_to do |format|
      if @goal_skill.update(goal_skill_params)
        format.html { redirect_to @goal_skill, notice: 'Goal skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_skill }
      else
        format.html { render :edit }
        format.json { render json: @goal_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_skills/1
  # DELETE /goal_skills/1.json
  def destroy
    @goal_skill.destroy
    respond_to do |format|
      format.html { redirect_to goal_skills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_skill
      @goal_skill = GoalSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_skill_params
      params.require(:goal_skill).permit(:goal_id, :skill_id, :required_skill_level)
    end
end
