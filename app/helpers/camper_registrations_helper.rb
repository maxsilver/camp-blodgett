module CamperRegistrationsHelper
  def camper_full_name(camper)
    "#{camper.last_name}, #{camper.first_name}"
  end
end
