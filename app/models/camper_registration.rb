class CamperRegistration < ActiveRecord::Base
  has_many :medications
  accepts_nested_attributes_for :medications

  has_many :camp_sessions

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :birth_date, presence: true
  validates :age_at_start_of_camp, presence: true
  validates :grade_next_year, presence: true
  validates :school, presence: true
  validates :adult_shirt_size, presence: true
  validates :parent_or_guardian_name, presence: true
  validates :parent_or_guardian_relationship, presence: true
  validates :parent_or_guardian_home_phone, presence: true
  validates :parent_or_guardian_cell_phone, presence: true
  validates :parent_or_guardian_employer, presence: true
  validates :parent_or_guardian_work_phone, presence: true
  validates :parent_or_guardian_email, presence: true
  validates :parent_or_guardian_allow_pickup_name_1, presence: true
  validates :parent_or_guardian_allow_pickup_phone_1, presence: true
  validates :parent_or_guardian_allow_pickup_name_2, presence: true
  validates :parent_or_guardian_allow_pickup_phone_2, presence: true
  validates :emergency_contact_name, presence: true
  validates :emergency_contact_phone, presence: true
  validates :emergency_contact_doctor, presence: true
  validates :emergency_contact_doctor_phone, presence: true
  validates :health_insurance, presence: true
  validates :health_insurance_policyholder_name, presence: true
  validates :health_insurance_policy_number, presence: true
  validates :health_insurance_group_number, presence: true
  validates :no_health_insurance, presence: true
  validates :hay_fever_asthma_respiratory_conditions, presence: true
  validates :diabetes, presence: true
  validates :eczema_skin_rashes, presence: true
  validates :heart_conditions, presence: true
  validates :bedwetting, presence: true
  validates :colds_sore_throats_earaches, presence: true
  validates :adhd_odd_ocd, presence: true
  validates :convulsions_seizures, presence: true
  validates :shortness_of_breath, presence: true
  validates :aspergers_autism, presence: true
  validates :other_health_info, presence: true
  validates :previous_health_history, presence: true
  validates :has_infectious_disease, presence: true
  validates :has_infection_disease_explanation, presence: true
  validates :known_allergies, presence: true
  validates :immunization_up_to_date, presence: true
  validates :tetanus_booster_shot, presence: true
  validates :measles_mumps_shot, presence: true
  validates :polio_shot, presence: true
  validates :hepatitis_b_shot, presence: true
  validates :parent_has_signed, presence: true
  validates :camp_check_in_location, presence: true
  validates :estimated_camp_fee, presence: true
  validates :deposit_amount, presence: true
  validates :balance_due, presence: true

  def self.males
    where(gender: 'M')
  end

  def self.females
    where(gender: 'F')
  end
end
