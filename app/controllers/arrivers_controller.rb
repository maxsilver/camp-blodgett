class ArriversController < ApplicationController
  def index
    @arrivers = CampSession.find(params[:camp_session_id]).camper_registrations
  end
end
