class CampSeason < ActiveRecord::Base
  has_many :camper_registrations
  has_many :discounts
  has_many :camp_sessions
end
