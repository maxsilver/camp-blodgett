class CabinAssignmentsController < ApplicationController
  def index
    @camp_sessions = CampSession.all
  end

  def show
    @camp_session = CampSession.where(id: params[:camp_session_id]).first  
    @camp_season  = @camp_session.camp_season
    CamperSession.auto_assign(@camp_session) unless @camp_session.has_assignments?
  end

  def new
    
  end

  def edit
  end

  def create
    @cabin_assignment = CabinAssignment.new(cabin_assignment_params)
    if @cabin_assignment.save
      redirect_to @cabin_assignment
    else
      render action: 'new'
    end
  end

  def update
    if @cabin_assignment.update(cabin_assignment_params)
      redirect_to @cabin_assignment
    else
      render 'edit'
    end
  end


  private

  def set_cabin_assignment
    @cabin_assignment = CabinAssignment.find(params[:id])
  end

  def cabin_assignments_params
    params.require(:cabin_assignments).permit!
  end
end
