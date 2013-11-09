class CampSessionsController < ApplicationController
  before_action :set_camp_session, only: [:show, :edit, :update]
  def index
    @camp_sessions = CampSession.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end


  private

  def set_camp_session
    @camp_session = CampSession.find(params[:id])
  end
end
