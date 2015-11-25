User.destroy_all
Post.destroy_all

50.times do   genre = ["men", "women"].sample
   last_name = Faker::Name.fr_last_name

   if genre == "men"
    first_name = Faker::Name.fr_first_name_m
  else    first_name = Faker::Name.fr_first_name_f   end

  job = ["media", "journalist", "journalist", "journalist"].sample
  if job == "journalist"
    siren = ""
    company_name = ""
  else
    siren = Faker::Company.fr_siren
    company_name = Faker::Company.fr_name
  end

  User.create(
    first_name: first_name,
    last_name: last_name,
    address: Faker::Address.fr_zip_and_city_in_region,
    password: "123soleil",
    password_confirmation: "123soleil",
    # picture: "http://api.randomuser.me/portraits/med/#{genre}/#{rand(0..61)}.jpg", # => TODO
    email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
    biography: Faker::Lorem.paragraph,
    company_name: company_name,
    birth_date: Faker::Date.between(22.years.ago, 55.years.ago),
    siren: siren,
    availability: true,
    speciality: Faker::Lorem.word,
    phone_number: Faker::Number.number(10)
  )

end










