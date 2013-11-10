class ArriversController < ApplicationController
  def index
    @camp_session = CampSession.find(params[:camp_session_id])
    @camp_season = @camp_session.camp_season
    @arrivers = @camp_session.camper_registrations
  end
end
