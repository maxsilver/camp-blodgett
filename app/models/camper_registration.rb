class CamperRegistration < ActiveRecord::Base
  has_many :medications
  accepts_nested_attributes_for :medications, reject_if: :all_blank

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
  validates :has_infectious_disease, presence: true
  validates :immunization_up_to_date, presence: true

  def self.males
    where(gender: 'M')
  end

  def self.females
    where(gender: 'F')
  end

  def season_year
    camp_sessions.first.camp_season.year
  end
end
