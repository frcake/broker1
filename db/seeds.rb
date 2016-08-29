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

=end



accessorychild2=Category.create!(:name => "Amp Covers")
accessorychild2.move_to_child_of(128)

=begin
accessorychild3	= Category.create!(:name => "Books and DVDs")
accessorychild4	= Category.create!(:name => "Cables")
accessorychild5	= Category.create!(:name => "Capos and Slides")
accessorychild7	= Category.create!(:name => "Cases and Gig Bags")
accessorychild8	= Category.create!(:name => "Cases and Gig Bags")
accessorychild9	= Category.create!(:name => "Cases and Gig Bags")
accessorychild10	= Category.create!(:name => "Cases and Gig Bags	")
accessorychild11	= Category.create!(:name => "Headphones")
accessorychild12	= Category.create!(:name => "Humidifiers")
accessorychild13	= Category.create!(:name => "Merchandise")
accessorychild14	= Category.create!(:name => "Metronome")
accessorychild15	= Category.create!(:name => "Picks")
accessorychild16	= Category.create!(:name => "Power Supplies")
accessorychild17	= Category.create!(:name => "Stands")
accessorychild18	= Category.create!(:name => "Straps")
accessorychild19	= Category.create!(:name => "Strings")
accessorychild20	= Category.create!(:name => "Strings")
accessorychild21	= Category.create!(:name => "Strings")
accessorychild22	= Category.create!(:name => "Strings")
accessorychild23	= Category.create!(:name => "Strings")
accessorychild24	= Category.create!(:name => "Strings")
accessorychild25	= Category.create!(:name => "Tools")
accessorychild26	= Category.create!(:name => "Tuners")


accessorychild2.move_to_child_of(42)
accessorychild3.move_to_child_of(42)
accessorychild4.move_to_child_of(42)
accessorychild5.move_to_child_of(42)

accessorychild7.move_to_child_of(42)
accessorychild8.move_to_child_of(42)
accessorychild9.move_to_child_of(42)
accessorychild10.move_to_child_of(42)
accessorychild11.move_to_child_of(42)
accessorychild12.move_to_child_of(42)
accessorychild13.move_to_child_of(42)
accessorychild14.move_to_child_of(42)
accessorychild15.move_to_child_of(42)
accessorychild16.move_to_child_of(42)
accessorychild17.move_to_child_of(42)
accessorychild18.move_to_child_of(42)
accessorychild19.move_to_child_of(42)
accessorychild20.move_to_child_of(42)
accessorychild21.move_to_child_of(42)
accessorychild22.move_to_child_of(42)
accessorychild23.move_to_child_of(42)
accessorychild24.move_to_child_of(42)
accessorychild25.move_to_child_of(42)
accessorychild26.move_to_child_of(42)

=end