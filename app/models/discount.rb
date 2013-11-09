class Discount < ActiveRecord::Base
  belongs_to :camp_season

  validate :description, presence: true
  validate :amount, presence: true
end
