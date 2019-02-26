# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying everything"

Residency.destroy_all
Transition.destroy_all
User.destroy_all
Event.destroy_all

puts "creating one event"

event1 = Event.new(
  title: "super journée",
  text:" blma blaiqmoigh^ù"
  )
event1.save!

puts "event created!"
puts "creating one user"

user1 = User.new(
  email:"toto@gmail.com",
  password:"toto@gmail.com"
  )
user1.save!

puts "user created!"
puts "creating one transition"

transition1 = Transition.new(
  date: "2019-03-01",
  hour: Time.now,
  place:"Lyon"
  )
transition1.save!

puts "transition created!"

puts "creating one residency"
residency1 = Residency.new(
  date_start: "2019-03-01",
  date_end: "2019-03-08",
)

residency1.user = user1
residency1.transition = transition1
residency1.save!
puts "residency created!"
