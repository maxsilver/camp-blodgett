class CampSession < ActiveRecord::Base
  belongs_to :camp_season

  has_many :camper_sessions
  has_many :camper_registrations, through: :camper_sessions
  has_many :cabins, through: :camper_sessions
  
  validates :start_date, presence: true
  validates :end_date, presence: true

  def has_assignments?
    assigned_campers = CamperSession
      .where(camp_session_id: self.id)
      .where("cabin_id IS NOT NULL")
      .count

    assigned_campers > 0
  end
end
