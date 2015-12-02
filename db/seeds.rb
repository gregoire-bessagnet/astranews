require 'rest-client'

def get_picture_url
  puts "- getting image"
  json = RestClient.get 'http://www.splashbase.co/api/v1/images/random'
  hash = JSON.parse(json)
  puts "- image: " + hash['url']
  return hash['url']
end




puts "----Destroying Users"
  User.destroy_all
puts "----Destroying Posts"
  Post.destroy_all

puts "----Seeding Users"

50.times do   genre = ["men", "women"].sample
   last_name = Faker::Name.fr_last_name

  if genre == "men"
    first_name = Faker::Name.fr_first_name_m
  else
    first_name = Faker::Name.fr_first_name_f
  end

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
    picture: "http://api.randomuser.me/portraits/med/#{genre}/#{rand(0..61)}.jpg", # => TODO
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


puts "----Seeding Posts"

20.times do


  users = User.all

  begin
    Post.create({
      title: Faker::Lorem.sentence,
      introduction: Faker::Lorem.paragraph,
      content: Faker::Lorem.paragraphs(3),
      date: Faker::Date.backward(90),
      synopsis: Faker::Lorem.sentence(2, true, 8),
      status:["Publié", "Brouillon"].sample,
      category:["Société", "Culture", "Science", "Arts", "Médias", "Finance", "Economie"].sample,
      character_number:Faker::Number.between(80, 300),
      city: Faker::Address.city,
      price_cents:Faker::Number.between(1, 10),
      licence:["Copyright", "Creative Commons", "Libre"].sample,
      user_id: users[rand(40)].id,
      remote_cover_url: get_picture_url()
    })
  rescue
    puts "/!\\ Image File Size Too Large"
  end

end




