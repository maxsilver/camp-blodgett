unless Rails.env.production?
  namespace :db do
    namespace :development do
      desc 'Create test data'

      task :populate => :environment do
        User.destroy_all

        User.create email: 'admin@campblodgett.org', password: 'password', password_confirmation: 'password'

        def rand_in_range(from, to)
          rand * (to - from) + from
        end

        CamperRegistration.delete_all

        200.times do |kid_n|
          birth_date = Time.at((8.years.ago.to_f - 13.year.ago.to_f)*rand + 13.year.ago.to_f)
          now        = Time.now.utc.to_date
          age        = now.year - birth_date.year - (birth_date.to_date.change(:year => now.year) > now ? 1 : 0)

          attrs = {
            last_name: Faker::Name.last_name,
            first_name: Faker::Name.first_name,
            gender: %W(M F).sample,
            address: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            zip: Faker::Address.zip,
            birth_date: birth_date,
            age_at_start_of_camp: age,
            grade_next_year: 6,
            school: Faker::Company.name,
            adult_shirt_size: "S",
            parent_or_guardian_name: Faker::Name.name,
            parent_or_guardian_relationship: "Parent",
            parent_or_guardian_home_phone: Faker::PhoneNumber.phone_number,
            parent_or_guardian_cell_phone: Faker::PhoneNumber.cell_phone,
            parent_or_guardian_employer: Faker::Company.name,
            parent_or_guardian_work_phone: Faker::PhoneNumber.phone_number,
            parent_or_guardian_email: Faker::Internet.email,
            parent_or_guardian_allow_pickup_name_1: Faker::Name.name,
            parent_or_guardian_allow_pickup_phone_1: Faker::Name.name,
            parent_or_guardian_allow_pickup_name_2: Faker::Name.name,
            parent_or_guardian_allow_pickup_phone_2: Faker::Name.name,
            emergency_contact_name: Faker::Name.name,
            emergency_contact_phone: Faker::PhoneNumber.phone_number,
            emergency_contact_doctor: Faker::Name.name,
            emergency_contact_doctor_phone: Faker::PhoneNumber.phone_number,
            health_insurance: Faker::Company.name,
            health_insurance_policyholder_name: Faker::Name.name,
            health_insurance_policy_number: Faker::Number.number(8),
            health_insurance_group_number: Faker::Number.number(6),
            no_health_insurance: true,
            hay_fever_asthma_respiratory_conditions: false,
            diabetes: false,
            eczema_skin_rashes: false,
            heart_conditions: false,
            bedwetting: false,
            colds_sore_throats_earaches: false,
            adhd_odd_ocd: false,
            convulsions_seizures: false,
            shortness_of_breath: false,
            aspergers_autism: false,
            other_health_info: Faker::Lorem.sentence,
            previous_health_history: Faker::Lorem.sentence,
            has_infectious_disease: false,
            has_infection_disease_explanation: Faker::Lorem.sentence,
            known_allergies: Faker::Lorem.sentence,
            immunization_up_to_date: false,
            tetanus_booster_shot: Time.at(rand_in_range(birth_date.to_f, Time.now.to_f)),
            measles_mumps_shot: Time.at(rand_in_range(birth_date.to_f, Time.now.to_f)),
            polio_shot: Time.at(rand_in_range(birth_date.to_f, Time.now.to_f)),
            hepatitis_b_shot: Time.at(rand_in_range(birth_date.to_f, Time.now.to_f)),
            parent_has_signed: false,
            camp_check_in_location: Faker::Address.street_address,
            estimated_camp_fee: Money.new(100, 'USD'),
            deposit_amount: Money.new(100, 'USD'),
            balance_due: Money.new(100, 'USD')
          }

          CamperRegistration.create!(attrs)
        end

      end
    end
  end
end