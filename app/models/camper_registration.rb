class CamperRegistration < ActiveRecord::Base
  has_many :medications, dependent: :destroy
  accepts_nested_attributes_for :medications, reject_if: :all_blank, allow_destroy: true

  has_many :camper_sessions
  has_many :camp_sessions, through: :camper_sessions

  has_many :camper_discounts
  has_many :discounts, through: :camper_discounts

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :adult_shirt_size, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |camper_registration|
        cabins = CampSeason.where(year: camper_registration.season_year).first.camp_sessions.map do |session|
          camper_session = camper_registration.camper_sessions.where(camp_session_id: session.id).first
          if camper_session.nil?
            "no session"
          elsif camper_session.cabin.nil?
            "no cabin"
          else
            print "GOT ONE: " + camper_session.cabin.name
            camper_session.cabin.name
          end
        end
        csv << camper_registration.attributes.values_at(*column_names) + cabins
      end
    end
  end

  def session_numbers
    camp_sessions.map(&:number).join(', ')
  end 

  def self.males
    where(gender: 'M')
  end

  def self.females
    where(gender: 'F')
  end

  def season_year
    camp_sessions.first.camp_season.year
  end

  def bus_check_box_applies
    camp_check_in_location != 'Camp'
  end

  def parent_or_guardian_preferred_phone
    # The order of the numbers below is significant.
    # The "best" phone number is first.
    [
      parent_or_guardian_home_phone,
      parent_or_guardian_cell_phone,
      parent_or_guardian_work_phone
    ].each { |number| return number if number.present? }
  end
end
