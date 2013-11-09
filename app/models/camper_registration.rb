class CamperRegistration < ActiveRecord::Base
  has_many :medications
  accepts_nested_attributes_for :medications

  has_many :camp_sessions

  def self.males
    where(gender: 'M')
  end

  def self.females
    where(gender: 'F')
  end
end
