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

#seeds lundi 25/02
Custody.create!(day_on: Date.today - 11,
                user: c1_parent1,
                title: "A la maison",
                text: "Daphné a joué à la maison, puis nous sommes allés au parc, il faisait beau.")

#seeds 26/02
Custody.create!(day_on: Date.today - 10,
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
                title: title,
                text: "Je trouve Daphné fatiguée, elle se couche très tôt et n'est pas de très bonne humeur en fin de journée...")

#seeds 01/03
Custody.create!(day_on: Date.today - 7,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 02/03
Custody.create!(day_on: Date.today - 6,
                user: c1_parent2,
                title: "Cinéma",
                text: "Nous sommes allées voir Dragons 3. C'était génial ! Le film est bien, Daphné a beaucoup ri, elle a même pleuré un peu... C'était émouvant !")

#seeds 03/03
Custody.create!(day_on: Date.today - 5,
                user: c1_parent2,
                title: "Dimanche tranquille",
                text: "Il Faisiat très beau, nous sommes allées manger une glace Place Sathonay")

#seeds lundi 04/03
Custody.create!(day_on: Date.today - 4,
                user: c1_parent2,
                title: nil,
                text: "Retour à l'école, tout s'est bien passé")

#seeds 05/03
Custody.create!(day_on: Date.today - 3,
                user: c1_parent1,
                title: nil,
                text: "Grosse plaque d'éczema sur le bras droit, je mets de la crème, voir comment ça évolue...")

#seeds 06/03
Custody.create!(day_on: Date.today - 2,
                user: c1_parent1,
                title: "Vélo",
                text: "Progrès incroyables ! Mais s'arrêter reste encore compliqué. ")

#seeds 07/03
Custody.create!(day_on: Date.today - 1,
                user: c1_parent1,
                title: "Chorale à l'école",
                text: "daphné apprends 'Pour louper l'école' d'Aldebert")

#seeds 08/03
Custody.create!(day_on: Date.today,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 09/03
Custody.create!(day_on: Date.today + 1,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 10/03
Custody.create!(day_on: Date.today + 2,
                user: c1_parent2,
                title: title,
                text: text)

#seeds lundi 11/03
Custody.create!(day_on: Date.today + 3,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 12/03
Custody.create!(day_on: Date.today + 4,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 13/03
Custody.create!(day_on: Date.today + 5,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 14/03
Custody.create!(day_on: Date.today + 6,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 15/03
Custody.create!(day_on: Date.today + 7,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 16/03
Custody.create!(day_on: Date.today + 8,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 17/03
Custody.create!(day_on: Date.today + 9,
                user: c1_parent2,
                title: title,
                text: text)

#seeds lundi 18/03
Custody.create!(day_on: Date.today + 10,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 19/03
Custody.create!(day_on: Date.today + 11,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 20/03
Custody.create!(day_on: Date.today + 12,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 21/03
Custody.create!(day_on: Date.today + 13,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 22/03
Custody.create!(day_on: Date.today + 14,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 23/03
Custody.create!(day_on: Date.today + 15,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 24/03
Custody.create!(day_on: Date.today + 16,
                user: c1_parent1,
                title: title,
                text: text)

#seeds lundi 25/03
Custody.create!(day_on: Date.today + 17,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 26/03
Custody.create!(day_on: Date.today + 18,
                user: c1_parent1,
                title: title,
                text: text)

#seeds 27/03
Custody.create!(day_on: Date.today + 19,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 28/03
Custody.create!(day_on: Date.today + 20,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 29/03
Custody.create!(day_on: Date.today + 21,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 30/03
Custody.create!(day_on: Date.today + 22,
                user: c1_parent2,
                title: title,
                text: text)

#seeds 31/03
Custody.create!(day_on: Date.today + 23,
                user: c1_parent2,
                title: title,
                text: text)

end

