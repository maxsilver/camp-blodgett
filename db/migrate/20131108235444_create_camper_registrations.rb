class CreateCamperRegistrations < ActiveRecord::Migration
  def change
    create_table :camper_registrations do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_initial
      t.string :gender
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.date :birth_date
      t.integer :age_at_start_of_camp
      t.integer :grade_next_year
      t.string :school
      t.string :adult_shirt_size
      t.string :parent_or_guardian_name
      t.string :parent_or_guardian_relationship
      t.string :parent_or_guardian_home_phone
      t.string :parent_or_guardian_cell_phone
      t.string :parent_or_guardian_employer
      t.string :parent_or_guardian_work_phone
      t.string :parent_or_guardian_email
      t.string :parent_or_guardian_allow_pickup_name_1
      t.string :parent_or_guardian_allow_pickup_phone_1
      t.string :parent_or_guardian_allow_pickup_name_2
      t.string :parent_or_guardian_allow_pickup_phone_2
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.string :emergency_contact_doctor
      t.string :emergency_contact_doctor_phone
      t.string :health_insurance
      t.string :health_insurance_policyholder_name
      t.string :health_insurance_policy_number
      t.string :health_insurance_group_number
      t.boolean :no_health_insurance
      t.boolean :hay_fever_asthma_respiratory_conditions
      t.boolean :diabetes
      t.boolean :eczema_skin_rashes
      t.boolean :heart_conditions
      t.boolean :bedwetting
      t.boolean :colds_sore_throats_earaches
      t.boolean :adhd_odd_ocd
      t.boolean :convulsions_seizures
      t.boolean :shortness_of_breath
      t.boolean :aspergers_autism
      t.text :other_health_info
      t.text :previous_health_history
      t.boolean :has_infectious_disease
      t.text :has_infection_disease_explanation
      t.text :known_allergies
      t.boolean :immunization_up_to_date
      t.date :tetanus_booster_shot
      t.date :measles_mumps_shot
      t.date :polio_shot
      t.date :hepatitis_b_shot
      t.boolean :parent_has_signed
      t.integer :year
      t.string :camp_check_in_location
      t.text :session_numbers
      t.money :estimated_camp_fee
      t.money :deposit_amount
      t.money :balance_due
      t.belongs_to :camp_season

      t.timestamps
    end
  end
end
