class CampSeasonsController < ApplicationController
  before_action :set_camp_season, only: [:show]

  def index
    @camp_seasons = CampSeason.order('year DESC').all
  end

  def new
    @camp_season = CampSeason.new
  end

  def create
    @camp_season = CampSeason.new(camp_season_params)

    if @camp_season.save
      redirect_to @camp_season
    else
      render 'new'
    end
  end


  private

  def set_camp_season
    @camp_season = CampSeason.find(params[:id])
  end

  def camp_season_params
    params.require(:camp_season).permit(:year)
  end
end
