module CampSeasonsHelper

  def most_recent_season
    CampSeason.order('year DESC').first.year
  end

end
