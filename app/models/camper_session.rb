class CamperSession < ActiveRecord::Base
  belongs_to :camp_session
  belongs_to :camper_registration
  belongs_to :cabin

  def self.kids(camp_session, cabin)
    includes(:camper_registration).where(cabin_id: cabin.id, camp_session_id: camp_session.id).order('camper_registrations.age_at_start_of_camp')
  end

  def self.auto_assign(camp_session)
    number_of_cabins = Cabin.count
    boys             = camp_session.camper_registrations.males.order('age_at_start_of_camp DESC')
    girls            = camp_session.camper_registrations.females.order('age_at_start_of_camp DESC')

    place_holder_cabins = CabinSplitter.new(number_of_cabins, boys, girls).split

    cabins = []
    Cabin.all.each do |cabin|
      cabins << OpenStruct.new(id: cabin.id, name: cabin.name, kids: place_holder_cabins.shift.compact)
    end

    cabins.each do |c|
      c.kids.each do |kid|
        camp_session.camper_sessions.create!(cabin_id: c.id, camper_registration_id: kid.id)
      end
    end
  end
end
