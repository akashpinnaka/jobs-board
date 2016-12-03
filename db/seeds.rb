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
Category.where(name: 'Finance').first_or_create(name: 'Marketing')
Category.where(name: 'Finance').first_or_create(name: 'Content Producing')
Category.where(name: 'Finance').first_or_create(name: 'Testing')




User.where(email: 'aakash.pinnaka.com').first_or_create(name: 'Akash Pinnaka', email: 'aakash.pinnaka@gmail.com', password: 'password')
User.where(email: 'pavani.pinnaka@gmail.com').first_or_create(name: 'Pavani Pinnaka', email: 'pavani.pinnaka@gmail.com', password: 'password')
User.where(email: 'pinnakasrinivas@gmail.com').first_or_create(name: 'Srinu Pinnaka', email: 'pinnakasrinivas@gmail.com', password: 'password')
User.where(email: 'pinnakajyothi@gmail.com').first_or_create(name: 'Jyothi Pinnaka', email: 'pinnakajyothi@gmail.com', password: 'password')
