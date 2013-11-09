class CamperSessionsController < ApplicationController
  before_action :set_camper_session, only: [:show, :edit, :update, :destroy]

  # GET /camper_sessions
  # GET /camper_sessions.json
  # def index
  #   @camper_sessions = CamperSession.all
  # end

  # # GET /camper_sessions/1
  # # GET /camper_sessions/1.json
  # def show
  # end

  # # GET /camper_sessions/new
  # def new
  #   @camper_session = CamperSession.new
  # end

  # # GET /camper_sessions/1/edit
  # def edit
  # end

  # # POST /camper_sessions
  # # POST /camper_sessions.json
  # def create
  #   @camper_session = CamperSession.new(camper_session_params)

  #   respond_to do |format|
  #     if @camper_session.save
  #       format.html { redirect_to @camper_session, notice: 'Camper session was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @camper_session }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @camper_session.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /camper_sessions/1
  # PATCH/PUT /camper_sessions/1.json
  def update
    respond_to do |format|
      if @camper_session.update(camper_session_params)
        format.html { redirect_to @camper_session, notice: 'Camper session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camper_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camper_sessions/1
  # DELETE /camper_sessions/1.json
  def destroy
    @camper_session.destroy
    respond_to do |format|
      format.html { redirect_to camper_sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper_session
      @camper_session = CamperSession.where({
        camper_registration_id: params[:camper_registration_id],
        camp_session_id: params[:camp_session_id]
      }).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camper_session_params
      params[:camper_session]
    end
end
