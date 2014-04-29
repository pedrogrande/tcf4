class ProgrammesController < ApplicationController
  before_action :set_programme, only: [:show, :edit, :update, :destroy, :save, :remove_unit, :add_unit, :enrol]

  def save
    @user = guest_user
    @user.update_attributes(programme_id: @programme.id)
  end

  def enrol
    @user = guest_user
    @user.update_attributes(programme_id: @programme.id)
    redirect_to programme_enrolment_path(programme: @programme.id)
  end

  def remove_unit
    @unit = Unit.find(params[:unit])
    @programme.units.delete(@unit)
    redirect_to :back
  end

  def add_unit
    @unit = Unit.find(params[:unit])
    if !@programme.units.include?(@unit)
      @programme.units << @unit
    end
    redirect_to :back
  end
  # GET /programmes
  # GET /programmes.json
  def index
    @programmes = Programme.all
  end

  # GET /programmes/1
  # GET /programmes/1.json
  def show
  end

  # GET /programmes/new
  def new
    @skill_groups = SkillGroup.all
    if !current_user
      @user = guest_user
      if @user.programme_id.nil?
        @programme = Programme.new
      else
        @programme = Programme.find(@user.programme_id)
      end
      # @user = current_user
    end

    @user.goals.each do |goal|
      goal.units.each do |unit|
        unit.skills.each do |skill|
          skill.unit_skills.each do |unit_skill|
            user_skill = @user.guest_user_skills.where(skill_id: skill.id).first
            if user_skill.skill_level < unit_skill.after_skill_level and !@programme.units.include?(unit)
              @programme.units << unit
            end
          end
        end
      end
    end
    @programme.save
    @user.update_attributes(programme_id: @programme.id)
    redirect_to my_programme_path(programme: @programme.id)
  end

  # GET /programmes/1/edit
  def edit
  end

  # POST /programmes
  # POST /programmes.json
  def create
    @programme = Programme.new(programme_params)

    respond_to do |format|
      if @programme.save
        format.html { redirect_to @programme, notice: 'Programme was successfully created.' }
        format.json { render :show, status: :created, location: @programme }
      else
        format.html { render :new }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programmes/1
  # PATCH/PUT /programmes/1.json
  def update
    respond_to do |format|
      if @programme.update(programme_params)
        format.html { redirect_to @programme, notice: 'Programme was successfully updated.' }
        format.json { render :show, status: :ok, location: @programme }
      else
        format.html { render :edit }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programmes/1
  # DELETE /programmes/1.json
  def destroy
    @programme.destroy
    respond_to do |format|
      format.html { redirect_to programmes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme
      @programme = Programme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programme_params
      params.require(:programme).permit(:user_id, :commenced, :completed, :name)
    end
end
