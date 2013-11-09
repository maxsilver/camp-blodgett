class CamperSession < ActiveRecord::Base
  belongs_to :camp_session
  belongs_to :camper_registration
end
