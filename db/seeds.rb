# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: 'Web Development').first_or_create(name: 'Web Development')
Category.where(name: 'Design').first_or_create(name: 'Design')
Category.where(name: 'Finance').first_or_create(name: 'Finance')

location = [
  "Hyderabad, India",
  "Delhi, India",
  "Newyork, NY",
  "Kukatpally, hyderabad",
  "Ramnagar colony, Addhanki"
]

User.where(email: 'bob@example.com').first_or_create(email: 'Bob Green', password: 'password')

10.times do
  User.create(email: Faker::Internet.email, password: 'password')
end

50.times do
  sleep 0.2
  Gig.create(name: Faker::Name.title,
             description: Faker::Lorem.paragraph(2),
             budget: rand(200..10000),
             location: location.sample,
             user_id: 1,
             category_id: rand(1..3))
end