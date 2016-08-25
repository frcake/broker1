# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


carlos = User.create(first_name: 'Carlos', email: 'carlos@email.com', password: 'Carlos1', password_confirmation: 'Carlos1')
freida = User.create(first_name: 'Frieda', email: 'freida@email.com', password: 'Freida1', password_confirmation: 'Freida1')
julian = User.create(first_name: 'Julian', email: 'julian@email.com', password: 'Julian1', password_confirmation: 'Julian1')
michael = User.create(first_name: 'Michael', email: 'mail@mail.com', password: '123', password_confirmation: '123')


guitars = Category.create(name: 'Ηλεκτρικές κιθάρες')
accessories = Category.create(name: 'Αξεσουάρ')
amplifiers = Category.create(name: 'Ενισχυτές')
orchestral = Category.create(name: 'Ορχηστρικά')
bass = Category.create(name: 'Μπάσο')
dj = Category.create(name: 'DJ')
livelighting = Category.create(name: 'Live & Φωτισμός')
drumspercussion = Category.create(name: 'Τύμπανα & κρουστά')
pedals = Category.create(name: 'Πετάλια')
folk = Category.create(name: 'Παραδοσιακά')
hifi = Category.create(name: 'Hi-Fi')
syntheseizers = Category.create(name: 'Syntheseizer & πλήκτρα')
parts = Category.create(name: 'Εξαρτήματα')
proaudio = Category.create(name: 'Επαγγελματικός ήχος')
