puts "Destroying everything..."

Medium.destroy_all
Message.destroy_all
Custody.destroy_all
User.destroy_all
Child.destroy_all


child1 = Child.create!(first_name: "Daphné", last_name: "G V", birthday: 3.years.ago)

c1_parent1 = User.create!(first_name: "Toto",
                          last_name: "G",

                          email: "toto@gmail.com",
                          password: 'azerty',
                          phone: '0602030405',
                          child: child1,
                          avatar: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551273327/avatar-1.png')

c1_parent2 = User.create!(first_name: "Albane",
                          last_name: "V",
                          email: "albane@gmail.com",
                          password: 'azerty',
                          phone: '0634353637',
                          child: child1,
                          avatar: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551273327/avatar-2.png')

message = Message.create!({
    body: "Bonjour, c'est quoi le nom du sirop que tu donnes à Daphné quand elle tousse?",
    sender: c1_parent1,
    receiver: c1_parent2,
    read: true
})
Message.where(id: message.id).update_all(send_at: 120.minutes.ago)

message = Message.create!({
    body: "Bonjour, tu devrais lire cet article, ca pourrait t'intéresser : 'http://lachargementalepourlesnuls.com",
    sender: c1_parent2,
    receiver: c1_parent1,
    read: true
})
Message.where(id: message.id).update_all(send_at: 118.minutes.ago)

message = Message.create!({
    body: "C'est du Stodal",
    sender: c1_parent1,
    receiver: c1_parent2,
})
Message.where(id: message.id).update_all(send_at: 30.minutes.ago)

#seeds lundi 25/02
custody_maison = Custody.create!(day_on: Date.today - 11,
                user: c1_parent1,
                title: "A la maison",
                text: "Daphné a joué à la maison, puis nous sommes allés au parc, il faisait beau.")

#seeds 26/02
custody_lego = Custody.create!(day_on: Date.today - 10,
                user: c1_parent1,
                title: "Cinéma",
                text: "Nous sommes allés au cinéma voir La grande aventure Légo 2. C'était sympa mais pas extraordinaire non plus")

#seeds 27/02
Custody.create!(day_on: Date.today - 9,
                user: c1_parent2,
                title: "RAS",
                text: "Tout va bien, rien de spécial")

#seeds 28/02
Custody.create!(day_on: Date.today - 8,
                user: c1_parent2,
                title: nil,
                text: "Je trouve Daphné fatiguée, elle se couche très tôt et n'est pas de très bonne humeur en fin de journée...")

#seeds 01/03
custody_cascade = Custody.create!(day_on: Date.today - 7,
                user: c1_parent2,
                title: "Cascade",
                text: "Nous nous sommes promenés et nous sommes allées voir une cascade. Daphné aime beaucoup marcher, c'est un vrai régal !")

#seeds 02/03
custody_dragons = Custody.create!(day_on: Date.today - 6,
                user: c1_parent2,
                title: "Cinéma",
                text: "Nous sommes allées voir Dragons 3. C'était génial ! Le film est bien, Daphné a beaucoup ri, elle a même pleuré un peu... C'était émouvant !")

#seeds 03/03
custody_glace = Custody.create!(day_on: Date.today - 5,
                user: c1_parent2,
                title: "Dimanche tranquille",
                text: "Il Faisait très beau, nous sommes allées manger une glace Place Sathonay")

#seeds lundi 04/03
Custody.create!(day_on: Date.today - 4,
                user: c1_parent2,
                title: nil,
                text: "Retour à l'école, tout s'est bien passé")

#seeds 05/03
Custody.create!(day_on: Date.today - 3,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 06/03
custody_velo = Custody.create!(day_on: Date.today - 2,
                user: c1_parent1,
                title: "Vélo",
                text: "Progrès incroyables ! Mais s'arrêter reste encore compliqué. ")

#seeds 07/03
Custody.create!(day_on: Date.today - 1,
                user: c1_parent1,
                title: "Chorale à l'école",
                text: "Daphné apprends 'Pour louper l'école' d'Aldebert")

#seeds 08/03
Custody.create!(day_on: Date.today,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 09/03
Custody.create!(day_on: Date.today + 1,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 10/03
Custody.create!(day_on: Date.today + 2,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds lundi 11/03
Custody.create!(day_on: Date.today + 3,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 12/03
Custody.create!(day_on: Date.today + 4,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 13/03
Custody.create!(day_on: Date.today + 5,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 14/03
Custody.create!(day_on: Date.today + 6,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 15/03
Custody.create!(day_on: Date.today + 7,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 16/03
Custody.create!(day_on: Date.today + 8,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 17/03
Custody.create!(day_on: Date.today + 9,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds lundi 18/03
Custody.create!(day_on: Date.today + 10,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 19/03nil
Custody.create!(day_on: Date.today + 11,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 20/03
Custody.create!(day_on: Date.today + 12,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 21/03
Custody.create!(day_on: Date.today + 13,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 22/03
Custody.create!(day_on: Date.today + 14,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 23/03
Custody.create!(day_on: Date.today + 15,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 24/03
Custody.create!(day_on: Date.today + 16,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds lundi 25/03
Custody.create!(day_on: Date.today + 17,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 26/03
Custody.create!(day_on: Date.today + 18,
                user: c1_parent1,
                title: nil,
                text: nil)

#seeds 27/03
Custody.create!(day_on: Date.today + 19,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 28/03
Custody.create!(day_on: Date.today + 20,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 29/03
Custody.create!(day_on: Date.today + 21,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 30/03
Custody.create!(day_on: Date.today + 22,
                user: c1_parent2,
                title: nil,
                text: nil)

#seeds 31/03
Custody.create!(day_on: Date.today + 23,
                user: c1_parent2,
                title: nil,
                text: nil)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551952919/simya/a_la_maison.jpg',
               custody_id: custody_maison.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551955729/simya/lego.jpg',
               custody_id: custody_lego.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551953495/simya/cascade_1-min.jpg',
               custody_id: custody_cascade.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551953495/simya/cascade2-min.jpg',
               custody_id: custody_cascade.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551956224/simya/cascade3-min.jpg',
               custody_id: custody_cascade.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551956223/simya/cascade4-min.jpg',
               custody_id: custody_cascade.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551952914/simya/dragons_3.jpg',
               custody_id: custody_dragons.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551952922/simya/glace_sathonay.jpg',
               custody_id: custody_glace.id)

Medium.create!(remote_photo_url: 'https://res.cloudinary.com/dvvkrrjc4/image/upload/v1551958088/simya/velo.jpg',
               custody_id: custody_velo.id)
