class CampSession < ActiveRecord::Base
  belongs_to :camp_season

  has_many :camper_sessions
  has_many :camper_registrations, through: :camper_sessions

  validates :start_date, presence: true
  validates :end_date, presence: true
end
