class CampSeason < ActiveRecord::Base
  has_many :camper_registrations
  has_many :discounts
  has_many :camp_sessions

  validates :year, presence: true, uniqueness: true, length: {is: 4}

  def self.most_recent
    order('year DESC').first
  end

  def self.most_recent_year
    most_recent.year
  end

end
