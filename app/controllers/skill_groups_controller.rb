class SkillGroupsController < ApplicationController
  before_action :set_skill_group, only: [:show, :edit, :update, :destroy]

  # GET /skill_groups
  # GET /skill_groups.json
  def index
    @skill_groups = SkillGroup.all
  end

  # GET /skill_groups/1
  # GET /skill_groups/1.json
  def show
  end

  # GET /skill_groups/new
  def new
    @skill_group = SkillGroup.new
  end

  # GET /skill_groups/1/edit
  def edit
  end

  # POST /skill_groups
  # POST /skill_groups.json
  def create
    @skill_group = SkillGroup.new(skill_group_params)

    respond_to do |format|
      if @skill_group.save
        format.html { redirect_to @skill_group, notice: 'Skill group was successfully created.' }
        format.json { render :show, status: :created, location: @skill_group }
      else
        format.html { render :new }
        format.json { render json: @skill_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_groups/1
  # PATCH/PUT /skill_groups/1.json
  def update
    respond_to do |format|
      if @skill_group.update(skill_group_params)
        format.html { redirect_to @skill_group, notice: 'Skill group was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_group }
      else
        format.html { render :edit }
        format.json { render json: @skill_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_groups/1
  # DELETE /skill_groups/1.json
  def destroy
    @skill_group.destroy
    respond_to do |format|
      format.html { redirect_to skill_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_group
      @skill_group = SkillGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_group_params
      params.require(:skill_group).permit(:name, :description, :icon)
    end
end
