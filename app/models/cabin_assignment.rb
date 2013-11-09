class CabinAssignment < ActiveRecord::Base
  belongs_to :camp_session

  has_many :camper_cabin_assignment
end
