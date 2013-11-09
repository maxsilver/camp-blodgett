class CampSessionsController < ApplicationController
  before_action :set_camp_session, only: [:show, :edit, :update]
  def index
    @camp_sessions = CampSession.joins(:camp_season).order('camp_seasons.year DESC').order('number ASC').all
  end

  def show
  end

  def new
    @camp_session = CampSession.new
  end

  def edit
  end

  def create
    @camp_session = CampSession.new(camp_session_params)
    if @camp_session.save
      redirect_to @camp_session
    else
      render action: 'new'
    end
  end

  def update
    if @camp_session.update(camp_session_params)
      redirect_to @camp_session
    else
      render action: 'edit'
    end
  end


  private

  def set_camp_session
    @camp_session = CampSession.find(params[:id])
  end

  def camp_session_params
    params.require(:camp_session).permit(:start_date, :end_date, :camp_season)
  end
end
