class Discount < ActiveRecord::Base
  belongs_to :camp_season
  has_many :camper_discounts
  has_many :camper_registrations, through: :camper_discounts

  validate :description, presence: true
  validate :amount, presence: true
end
