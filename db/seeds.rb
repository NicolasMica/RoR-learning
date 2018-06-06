# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

for i in 1..10
	user = User.create do |user|
		user.firstname = Faker::Name.first_name
		user.lastname = Faker::Name.last_name
		user.email = Faker::Internet.email
		user.phone = Faker::PhoneNumber.cell_phone
		user.birthdate = Faker::Date.birthday(18, 30)
	end

	rand(1..7).times do
		Photo.create do |photo|
			photo.name = Faker::Lorem.sentence(1, false, 3)
			photo.file = 'https://picsum.photos/800/480/?' + rand(1..9999).to_s
			photo.user_id = user.id
		end
	end
end
