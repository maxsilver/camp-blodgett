class CamperDiscounts < ActiveRecord::Base
  belongs_to :camper_registration
  belongs_to :discount
end
