class CamperRegistration < ActiveRecord::Base
  has_many :medications
  has_many :camp_sessions  
end
