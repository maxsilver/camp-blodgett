(1..10).each do |i|
  Cabin.find_or_create_by_name(name: "Cabin #{i}")
end

User.create email: 'admin@campblodgett.org', password: 'changemenow', password_confirmation: 'changemenow'
