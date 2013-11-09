class CamperCabinAssignment < ActiveRecord::Base
  belongs_to :cabin_assignemnt
  has_one :camper_registration
  has_one :cabin
end
