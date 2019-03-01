f

puts "Destroying everything..."

Medium.destroy_all
Message.destroy_all
Custody.destroy_all
User.destroy_all
Child.destroy_all


child1 = Child.create!(first_name: "child f_name", last_name: "child l_name", birthday: 3.years.ago)

c1_parent1 = User.create!(first_name: "Toto",
                          last_name: "Logy",

                          email: "toto@gmail.com",
                          password: 'azerty',
                          phone: '0602030405',
                          child: child1,
                          avatar: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551273327/avatar-1.png')

c1_parent2 = User.create!(first_name: "Eva",
                          last_name: "Noe",
                          email: "titi@gmail.com",
                          password: 'azerty',
                          phone: '0634353637',
                          child: child1,
                          avatar: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551273327/avatar-2.png')

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
    "43" => "Parc",
    "62" => "Chez papi"
  }
  textes = {
    "43" => "On est allé se promener au parc aujourd'hui",
    "62" => "On a mangé chez papi"
  }


  day_on = Date.parse("Monday") + n
  user_id = (n % 7 < 4) ? c1_parent1 : c1_parent2
  title = titles[n.to_s]
  text = textes[n.to_s]

  Custody.create!(day_on: day_on, user: user_id, title: title, text: text)

end

