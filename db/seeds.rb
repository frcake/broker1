# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#carlos = User.create(first_name: 'Carlos', email: 'carlos@email.com', password: 'Carlos1', password_confirmation: 'Carlos1')
#freida = User.create(first_name: 'Frieda', email: 'freida@email.com', password: 'Freida1', password_confirmation: 'Freida1')
#julian = User.create(first_name: 'Julian', email: 'julian@email.com', password: 'Julian1', password_confirmation: 'Julian1')
##michael = User.create(first_name: 'Michael', email: 'mail@mail.com', password: '123', password_confirmation: '123')

=begin

guitars = Category.create(name: 'Ηλεκτρικές κιθάρες')
accessories = Category.create(name: 'Αξεσουάρ')
amplifiers = Category.create(name: 'Ενισχυτές')
orchestral = Category.create(name: 'Ορχηστρικά')
bass = Category.create(name: 'Μπάσο')
dj = Category.create(name: 'DJ')
livelighting = Category.create(name: 'PA')
drumspercussion = Category.create(name: 'Τύμπανα')
pedals = Category.create(name: 'Πετάλια')
folk = Category.create(name: 'Παραδοσιακά')
hifi = Category.create(name: 'Hi-Fi')
syntheseizers = Category.create(name: 'Synths')
parts = Category.create(name: 'Parts')
proaudio = Category.create(name: 'ProAudio')



=en


#ACCESSORIES CHILDREN

accessorychild3= Category.create(:name => "Κάλυμα ενισχυτή")
accessorychild3.move_to_child_of(206)

accessorychild4= Category.create(:name => "Καλώδια")
accessorychild4.move_to_child_of(206)

accessorychild5= Category.create(:name => "Κάπο and Slides")
accessorychild5.move_to_child_of(206)

accessorychild7= Category.create(:name => "Θήκες and Gig Bags")
accessorychild7.move_to_child_of(206)

accessorychild11= Category.create(:name => "Ακουστικά")
accessorychild11.move_to_child_of(206)

accessorychild12= Category.create(:name => "Αφυγραντήρες")
accessorychild12.move_to_child_of(206)

accessorychild13= Category.create(:name => "Merchandise")
accessorychild13.move_to_child_of(206)

accessorychild14= Category.create(:name => "Μετρονόμοι")
accessorychild14.move_to_child_of(206)

accessorychild15= Category.create(:name => "Πένες")
accessorychild15.move_to_child_of(206)

accessorychild16= Category.create(:name => "Τροφοδοτικά")
accessorychild16.move_to_child_of(206)

accessorychild17= Category.create(:name => "Stands")
accessorychild17.move_to_child_of(206)

accessorychild18= Category.create(:name => "Ζώνες")
accessorychild18.move_to_child_of(206)

accessorychild19= Category.create(:name => "Χορδές")
accessorychild19.move_to_child_of(206)

accessorychild25= Category.create(:name => "Εργαλεία")
accessorychild25.move_to_child_of(206)

accessorychild26= Category.create(:name => "Κουρδιστήρια")
accessorychild26.move_to_child_of(206)




 #ACCESSORIES > Θήκες και GigBags GRANDCHILDREN id:222
accessorychild1= Category.create(:name => "Σκληρές Θήκες Κιθάρας")
accessorychild1.move_to_child_of(222)

accessorychild2= Category.create(:name => "Θήκες Κιθάρας")
accessorychild2.move_to_child_of(222)

accessorychild3= Category.create(:name => "Σκληρές Θήκες Μπάσου")
accessorychild3.move_to_child_of(222)

accessorychild4= Category.create(:name => "Θήκες Μπάσου")
accessorychild4.move_to_child_of(222)

#ACCESSORIES > χορδές GRANDCHILDREN id:231

accessorychild5= Category.create(:name => "Χορδές Ηλεκτρικής Κιθάρας")
accessorychild5.move_to_child_of(231)

accessorychild6= Category.create(:name => "Χορδές Κλασσικής Κιθάρας")
accessorychild6.move_to_child_of(231)

accessorychild7= Category.create(:name => "Χορδές Ακουστικής Κιθάρας")
accessorychild7.move_to_child_of(231)

accessorychild8= Category.create(:name => "Χορδές Μπάσου")
accessorychild8.move_to_child_of(231)

accessorychild9= Category.create(:name => "Άλλες Χορδές")
accessorychild9.move_to_child_of(231)

=end


=begin
#GUITARS CHILDREN

guitarschild1 = Category.create(:name => "Ηλεκτρικές")
guitarschild1.move_to_child_of(205)

guitarschild2 = Category.create(:name => "Ακουστικές")
guitarschild2.move_to_child_of(205)

guitarschild3 = Category.create(:name => "Κλασσικές")
guitarschild3.move_to_child_of(205)

guitarschild4 = Category.create(:name => "Αριστερόχειρες")
guitarschild4.move_to_child_of(205)

guitarschild5 = Category.create(:name => "7-χορδες +")
guitarschild5.move_to_child_of(205)

=end






