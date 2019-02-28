# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying everything..."

Message.destroy_all
Custody.destroy_all
User.destroy_all
Child.destroy_all


child1 = Child.create!(first_name: "child f_name", last_name: "child l_name", birthday: 3.years.ago)

c1_parent1 = User.create!(first_name: "c1p1 f_name",
                          last_name: "c1p1 l_name",
                          email: "toto@gmail.com",
                          password: 'azerty',
                          phone: '0602030405',
                          child: child1)

c1_parent2 = User.create!(first_name: "c1p2 f_name",
                          last_name: "c1p2 l_name",
                          email: "titi@gmail.com",
                          password: 'azerty',
                          phone: '0634353637',
                          child: child1)

message = Message.create!({
    body: 'coucou ça va?',
    sender: c1_parent1,
    receiver: c1_parent2,
    read: true
})
Message.where(id: message.id).update_all(send_at: 120.minutes.ago)

message = Message.create!({
    body: 'oui et toi?',
    sender: c1_parent2,
    receiver: c1_parent1,
    read: true
})
Message.where(id: message.id).update_all(send_at: 110.minutes.ago)

message = Message.create!({
    body: 'bof...',
    sender: c1_parent1,
    receiver: c1_parent2,
})
Message.where(id: message.id).update_all(send_at: 30.minutes.ago)


40.times do |n|
  titles = {
    "3" => "bonjour",
    "32" => "chez papi et mami"
  }

  day_on = Date.parse("Monday") + n
  user_id = (n % 7 < 4) ? c1_parent1 : c1_parent2
  title = titles[n.to_s]

  Custody.create!(day_on: day_on, user: user_id, title: title)
end
