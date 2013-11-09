class CamperRegistration < ActiveRecord::Base
  belongs_to :camp_season
  has_many :medications
  accepts_nested_attributes_for :medications

  has_many :camper_sessions
  has_many :camp_sessions, through: :camper_sessions

  def self.males
    where(gender: 'M')
  end

  def self.females
    where(gender: 'F')
  end

  def self.current_session_campers(year)
    all
  end
end
