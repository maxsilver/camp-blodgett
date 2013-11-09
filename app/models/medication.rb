class Medication < ActiveRecord::Base
  belongs_to :camper_registration

  validate :name, presence: true
  validate :frequency, presence: true
  validate :dosage, presence: true
end
