class CamperRegistrationsController < ApplicationController
  before_action :set_camper_registration, only: [:show, :edit, :update]

  def index
    @camper_registrations = CamperRegistration.all
  end

  def show
  end

  def new
    @camper_registration = CamperRegistration.new
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


  private

  def set_camper_registration
    @camper_registration = CamperRegistration.find(params[:id])
  end
  
end
