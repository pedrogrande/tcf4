class UnitSessionsController < ApplicationController
  before_action :set_unit_session, only: [:show, :edit, :update, :destroy]

  # GET /unit_sessions
  # GET /unit_sessions.json
  def index
    @unit_sessions = UnitSession.all
  end

  # GET /unit_sessions/1
  # GET /unit_sessions/1.json
  def show
  end

  # GET /unit_sessions/new
  def new
    @unit_session = UnitSession.new
  end

  # GET /unit_sessions/1/edit
  def edit
  end

  # POST /unit_sessions
  # POST /unit_sessions.json
  def create
    @unit_session = UnitSession.new(unit_session_params)
    @unit_session.day = Date::DAYNAMES[@unit_session.date.wday]

    respond_to do |format|
      if @unit_session.save
        format.html { redirect_to @unit_session, notice: 'Unit session was successfully created.' }
        format.json { render :show, status: :created, location: @unit_session }
      else
        format.html { render :new }
        format.json { render json: @unit_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_sessions/1
  # PATCH/PUT /unit_sessions/1.json
  def update
    @unit_session.update_attributes(day: Date::DAYNAMES[@unit_session.date.wday])
    respond_to do |format|
      if @unit_session.update(unit_session_params)
        format.html { redirect_to @unit_session, notice: 'Unit session was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_session }
      else
        format.html { render :edit }
        format.json { render json: @unit_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_sessions/1
  # DELETE /unit_sessions/1.json
  def destroy
    @unit_session.destroy
    respond_to do |format|
      format.html { redirect_to unit_sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_session
      @unit_session = UnitSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_session_params
      params.require(:unit_session).permit(:unit_id, :day, :date, :start_time, :end_time, :location_id, :number_of_places, :number_of_students_registered)
    end
end
