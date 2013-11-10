class DepartersController < ApplicationController
  def index
    @departers = CampSession.find(params[:camp_session_id]).camper_registrations.order("last_name, first_name")
  end
end
