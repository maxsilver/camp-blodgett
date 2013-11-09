class CabinAssignmentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @camp_season = CampSeason.last
    @camp_session = @camp_season.camp_sessions.last

    number_of_cabins = Cabin.count
    boys             = @camp_session.camper_registrations.males.order('age_at_start_of_camp DESC')
    girls            = @camp_session.camper_registrations.females.order('age_at_start_of_camp DESC')

    place_holder_cabins = CabinSplitter.new(number_of_cabins, boys, girls).split

    @cabins = []
    Cabin.all.each do |cabin|
      @cabins << OpenStruct.new(id: cabin.id, name: cabin.name, kids: place_holder_cabins.shift.compact)
    end
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
