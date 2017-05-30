# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

main_ingredients = ["Beef","Fish","Lamb","Pork","Poultry","Shellfish","Vegeterian"]
cuisine = 
["African",
"American",
"Asian",
"British",
"Cajun Creole",
"Caribbean",
"Chinese",
"Eastern European",
"Egyptian",
"French",
"German",
"Greek",
"Indian",
"Italian",
"Japanese",
"Korean",
"Latin American",
"Mediterranean",
"Mexican",
"Middle Eastern",
"Moroccan",
"Nepalese",
"Southern",
"Spanish",
"Swedish",
"Thai",
"Vietnamese",
"Other"]

main_ingredients.each do |ing|
	MainIngredient.create(name: ing)
end

cuisine.each do |cuisine|
	Cuisine.create(name: cuisine)
end

ActiveRecord::Base.transaction do
  40.times do |t|
  	user = User.new
  	user[:name] = Faker::Name.name
  	user[:email] = Faker::Internet.email
  	user[:birthday] = Faker::Date.birthday(18, 65)
    user[:phone_no] = Faker::PhoneNumber.cell_phone
  	user[:street] = Faker::Address.street_address
  	user[:city] = Faker::Address.city
  	user[:postcode] = Faker::Address.postcode
  	user[:state] = Faker::Address.state
  	user.save
  	user.update(password: "abc")
  end
end
