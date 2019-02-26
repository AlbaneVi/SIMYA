# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all

event1 = Event.new(title: "super journée",
                    text:" blma blaiqmoigh^ù")
event1.save!

user1 = User.new(email:"toto@gmail.com",
                  password:"toto@gmail.com"
                  )
user1.save!

