class CabinAssignmentsController < ApplicationController
  before_action :set_camper_session, only: [:update]

  def index
    @camp_sessions = CampSession.all
  end

  def show
    @camp_session = CampSession.where(id: params[:camp_session_id]).first  
    @camp_season  = @camp_session.camp_season
    @unassigned   = @camp_session.camper_sessions.where(cabin_id: nil)
    CamperSession.auto_assign(@camp_session) unless @camp_session.has_assignments?
  end

  def update
    respond_to do |format|
      if @camper_session.update_column(:cabin_id, camper_session_params)
        format.json { head :no_content }
      else
        format.json { render json: @camper_session.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_cabin_assignment
    @cabin_assignment = CabinAssignment.find(params[:id])
  end

  def cabin_assignments_params
    params.require(:cabin_assignments).permit!
  end

  def set_camper_session
    @camper_session = CamperSession.where({
      camper_registration_id: params[:camper_registration_id],
      camp_session_id: params[:camp_session_id]
    }).first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camper_session_params
    params.require(:cabin_id)
  end
end
