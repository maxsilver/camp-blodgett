class Medication < ActiveRecord::Base
  belongs_to :camper_registration

  validates :name, presence: true
  validates :frequency, presence: true
  validates :dosage, presence: true
end
