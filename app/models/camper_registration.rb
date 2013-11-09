class CamperRegistration < ActiveRecord::Base
  has_many :medications
  accepts_nested_attributes_for :medications

  has_many :camper_sessions
  has_many :camp_sessions, through: :camper_sessions

  has_many :camper_discounts
  has_many :discounts, through: :camper_discounts

  def self.males
    where(gender: 'M')
  end

  def self.females
    where(gender: 'F')
  end

  def self.current_session_campers(year)
    debugger
    joins(:camp_sessions => :camp_seasons).where('camp_seasons.year = ?', year)
  end

  def season_year
    camp_sessions.first.camp_season.year
  end
end
