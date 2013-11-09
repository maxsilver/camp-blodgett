class CamperRegistrationsController < ApplicationController
  before_action :set_camper_registration, only: [:show, :edit, :update, :add_medication]

  def index
    params[:camp_season] ||= CampSeason.most_recent_year
    @camper_registrations = CampSeason.campers_for_year(params[:camp_season]).page(params[:page]).order('last_name ASC')
  end

  def show
  end

  def new
    @camper_registration = CamperRegistration.new
    3.times { @camper_registration.medications.build }
  end

  def edit
  end

  def create
    @camper_registration = CamperRegistration.new(camper_registration_params)
    if @camper_registration.save
      redirect_to @camper_registration
    else
      render action: 'new'
    end
  end

  def update
    if @camper_registration.update(camper_registration_params)
      redirect_to @camper_registration
    else
      render action: 'edit'
    end
  end

  def add_medication
    @camper_registration.medications.build
    render 'edit'
  end


  private

  def set_camper_registration
    @camper_registration = CamperRegistration.find(params[:id])
  end

  def camper_registration_params
    params.require(:camper_registration).permit!
  end

end
