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

=begin
#BASS CHILDREN BASS ID :209

basschild1 = Category.create(:name => "4-χορδο")
basschild1.move_to_child_of(209)

basschild1 = Category.create(:name => "5-χορδο+")
basschild1.move_to_child_of(209)

basschild1 = Category.create(:name => "Ακουστικό")
basschild1.move_to_child_of(209)

basschild1 = Category.create(:name => "Αριστερόχειρες")
basschild1.move_to_child_of(209)

basschild1 = Category.create(:name => "Κόντρα Μπάσο")
basschild1.move_to_child_of(209)
=end



=begin
#AMPS CHILDREN  AMP ID : 207

ampchild1=Category.create(:name => "Ακουστικών οργάνων")		
ampchild1.move_to_child_of(207)

ampchild2=Category.create(:name => "Attenuators")		
ampchild2.move_to_child_of(207)

ampchild3=Category.create(:name => "Μπάσου")		
ampchild3.move_to_child_of(207)

ampchild4=Category.create(:name => "Κεφαλές Μπάσου ")		
ampchild4.move_to_child_of(207)

ampchild5=Category.create(:name => "Καμπίνες Μπάσου")		
ampchild5.move_to_child_of(207)

ampchild6=Category.create(:name => "Κιθάρας")		
ampchild6.move_to_child_of(207)

ampchild7=Category.create(:name => "Κεφαλές Κιθάρας ")		
ampchild7.move_to_child_of(207)

ampchild8=Category.create(:name => "Καμπίνες Κιθάρας")		
ampchild8.move_to_child_of(207)

ampchild9=Category.create(:name => "Πλήκτρων")		
ampchild9.move_to_child_of(207)

ampchild10=Category.create(:name => "Modeling Amps")		
ampchild10.move_to_child_of(207)
=end


=begin

#HIFI ID=215
homeaudiochild1=Category.create(:name => "Ενισχυτές")	
homeaudiochild1.move_to_child_of(215)

homeaudiochild2=Category.create(:name => "Καλώδια")	
homeaudiochild2.move_to_child_of(215)

homeaudiochild4=Category.create(:name => "Digital Players")	
homeaudiochild4.move_to_child_of(215)

homeaudiochild9=Category.create(:name => "Equalizers")	
homeaudiochild9.move_to_child_of(215)

homeaudiochild10=Category.create(:name => "Ακουστικά")	
homeaudiochild10.move_to_child_of(215)

homeaudiochild12=Category.create(:name => "Προενισχυτές")	
homeaudiochild12.move_to_child_of(215)

homeaudiochild13=Category.create(:name => "Δέκτες")	
homeaudiochild13.move_to_child_of(215)

homeaudiochild14=Category.create(:name => "Ηχεία")	
homeaudiochild14.move_to_child_of(215)

homeaudiochild15=Category.create(:name => "Subwoofers")	
homeaudiochild15.move_to_child_of(215)

homeaudiochild16=Category.create(:name => "Μπομπινόφωνα")	
homeaudiochild16.move_to_child_of(215)

homeaudiochild20=Category.create(:name => "Κασετόφωνα")	
homeaudiochild20.move_to_child_of(215)

homeaudiochild17=Category.create(:name => "Ραδιόφωνα")	
homeaudiochild17.move_to_child_of(215)

homeaudiochild18=Category.create(:name => "Πικάπ")	
homeaudiochild18.move_to_child_of(215)

homeaudiochild19=Category.create(:name => "Εξαρτήματα και Αξεσουάρ")	
homeaudiochild19.move_to_child_of(215)

=end


=begin
#PARTS id=217

partschild3=Category.create(:name => "Parts Ενισχυτών")	
partschild3.move_to_child_of(217)

partschild4=Category.create(:name => "Parts Μπάσου")	
partschild4.move_to_child_of(217)

partschild5=Category.create(:name => "Μαγνήτες Μπάσου")
partschild5.move_to_child_of(217)

partschild6=Category.create(:name => "Σώματα Κιθάρας")	
partschild6.move_to_child_of(217)

partschild7=Category.create(:name => "Parts Κιθάρας")	
partschild7.move_to_child_of(217)

partschild10=Category.create(:name => "Μαγνήτες Κιθάρας")	
partschild10.move_to_child_of(217)

partschild11=Category.create(:name => "Knobs")	
partschild11.move_to_child_of(217)

partschild12=Category.create(:name => "Εξαρτήματα Πεταλιών")	
partschild12.move_to_child_of(217)

partschild13=Category.create(:name => "Pickguards")	
partschild13.move_to_child_of(217)

partschild14=Category.create(:name => "Ηχεία")	
partschild14.move_to_child_of(217)

partschild15=Category.create(:name => "Λάμπες")	
partschild15.move_to_child_of(217)

partschild16=Category.create(:name => "Κλειδιά")	
partschild16.move_to_child_of(217)

partschild16=Category.create(:name => "Διάφορα")	
partschild16.move_to_child_of(217)


=end

=begin
#DRUMS ID = 212


drumschild2=Category.create(:name => "Διάφορα Κρουστά")	
drumschild2.move_to_child_of(212)

drumschild3=Category.create(:name => "Κύμβαλα")	
drumschild3.move_to_child_of(212)

drumschild8=Category.create(:name => "Drum Machines και Samplers")
drumschild8.move_to_child_of(212)

drumschild9=Category.create(:name => "Κομμάτια Set")	
drumschild9.move_to_child_of(212)

drumschild13=Category.create(:name => "Ηλεκτρονικά Τύμπανα")	
drumschild13.move_to_child_of(212)

drumschild15=Category.create(:name => "Τύμπανα χειρός")	
drumschild15.move_to_child_of(212)

drumschild19=Category.create(:name => "Pad Controllers")	
drumschild19.move_to_child_of(212)

drumschild20=Category.create(:name => "Parts and Accessories")	
drumschild20.move_to_child_of(212)

=end

#
