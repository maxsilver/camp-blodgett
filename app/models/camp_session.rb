class CampSession < ActiveRecord::Base
  belongs_to :camp_season

  validates :start_date, presence: true
  validates :end_date, presence: true
end
