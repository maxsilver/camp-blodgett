class CabinAssignmentsController < ApplicationController
  before_action :set_cabin_assignment, only: [:show, :edit, :update, :destroy]

  def index
    @cabin_assignments = CabinAssignment.all
  end

  def show
  end

  def new
    @cabin_assignment = CabinAssignment.new
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
