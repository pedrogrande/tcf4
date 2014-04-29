class GoalsController < ApplicationController
  before_action :set_goal, only: [:choose, :show, :edit, :update, :destroy, :add_unit, :remove_unit]

  def add_unit
    @unit = Unit.find(params[:unit])
    @goal.units << @unit
    redirect_to :back
  end

  def remove_unit
    @unit = Unit.find(params[:unit])
    @goal.units.delete(@unit)
    redirect_to :back
  end

  def choose
    if current_user
      @user_goal = UserGoal.new
      @user_goal.user = current_user
      @user_goal.goal = @goal
      @user_goal.save
    elsif guest_user
      @guest_user_goal = GuestUserGoal.new
      @user = guest_user
      @guest_user_goal.guest_user = @user
      @guest_user_goal.goal = @goal
      @guest_user_goal.save
    end
    redirect_to :back
  end
  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :description, :icon)
    end
end
