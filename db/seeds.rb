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
#michael = User.create(first_name: 'Michael', email: 'mail@mail.com', password: '123', password_confirmation: '123')

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



#GUITARS CHILDREN
=begin
guitarschild1 = Category.create(:name => "Ηλεκτρικές")
guitarschild1.move_to_child_of(2)

guitarschild2 = Category.create(:name => "Ακουστικές")
guitarschild2.move_to_child_of(2)

guitarschild3 = Category.create(:name => "Κλασσικές")
guitarschild3.move_to_child_of(2)

guitarschild4 = Category.create(:name => "Αριστερόχειρες")
guitarschild4.move_to_child_of(2)

guitarschild5 = Category.create(:name => "7-χορδες +")
guitarschild5.move_to_child_of(2)
=end

#ACCESSORIES CHILDREN
=begin
accessorychild3= Category.create(:name => "Κάλυμα ενισχυτή")
accessorychild3.move_to_child_of(3)

accessorychild4= Category.create(:name => "Καλώδια")
accessorychild4.move_to_child_of(3)

accessorychild5= Category.create(:name => "Κάπο and Slides")
accessorychild5.move_to_child_of(3)

accessorychild7= Category.create(:name => "Θήκες and Gig Bags")
accessorychild7.move_to_child_of(3)

accessorychild11= Category.create(:name => "Ακουστικά")
accessorychild11.move_to_child_of(3)

accessorychild12= Category.create(:name => "Αφυγραντήρες")
accessorychild12.move_to_child_of(3)

accessorychild13= Category.create(:name => "Merchandise")
accessorychild13.move_to_child_of(3)

accessorychild14= Category.create(:name => "Μετρονόμοι")
accessorychild14.move_to_child_of(3)

accessorychild15= Category.create(:name => "Πένες")
accessorychild15.move_to_child_of(3)

accessorychild16= Category.create(:name => "Τροφοδοτικά")
accessorychild16.move_to_child_of(3)

accessorychild17= Category.create(:name => "Stands")
accessorychild17.move_to_child_of(3)

accessorychild18= Category.create(:name => "Ζώνες")
accessorychild18.move_to_child_of(3)

accessorychild19= Category.create(:name => "Χορδές")
accessorychild19.move_to_child_of(3)

accessorychild25= Category.create(:name => "Εργαλεία")
accessorychild25.move_to_child_of(3)

accessorychild26= Category.create(:name => "Κουρδιστήρια")
accessorychild26.move_to_child_of(3)

=end

=begin
 #ACCESSORIES > Θήκες και GigBags GRANDCHILDREN id:20
accessorychild1= Category.create(:name => "Σκληρές Θήκες Κιθάρας")
accessorychild1.move_to_child_of(49)

accessorychild2= Category.create(:name => "Θήκες Κιθάρας")
accessorychild2.move_to_child_of(49)

accessorychild3= Category.create(:name => "Σκληρές Θήκες Μπάσου")
accessorychild3.move_to_child_of(49)

accessorychild4= Category.create(:name => "Θήκες Μπάσου")
accessorychild4.move_to_child_of(49)

#ACCESSORIES > χορδές GRANDCHILDREN id:29

accessorychild5= Category.create(:name => "Χορδές Ηλεκτρικής Κιθάρας")
accessorychild5.move_to_child_of(58)

accessorychild6= Category.create(:name => "Χορδές Κλασσικής Κιθάρας")
accessorychild6.move_to_child_of(58)

accessorychild7= Category.create(:name => "Χορδές Ακουστικής Κιθάρας")
accessorychild7.move_to_child_of(58)

accessorychild8= Category.create(:name => "Χορδές Μπάσου")
accessorychild8.move_to_child_of(58)

accessorychild9= Category.create(:name => "Άλλες Χορδές")
accessorychild9.move_to_child_of(58)




=end
=begin


#BASS CHILDREN BASS ID :6

basschild1 = Category.create(:name => "4-χορδο")
basschild1.move_to_child_of(6)

basschild1 = Category.create(:name => "5-χορδο+")
basschild1.move_to_child_of(6)

basschild1 = Category.create(:name => "Ακουστικό")
basschild1.move_to_child_of(6)

basschild1 = Category.create(:name => "Αριστερόχειρες")
basschild1.move_to_child_of(6)

basschild1 = Category.create(:name => "Κόντρα Μπάσο")
basschild1.move_to_child_of(6)




#AMPS CHILDREN  AMP ID : 4

ampchild1=Category.create(:name => "Ακουστικών οργάνων")		
ampchild1.move_to_child_of(4)

ampchild2=Category.create(:name => "Attenuators")		
ampchild2.move_to_child_of(4)

ampchild3=Category.create(:name => "Μπάσου")		
ampchild3.move_to_child_of(4)

ampchild4=Category.create(:name => "Κεφαλές Μπάσου ")		
ampchild4.move_to_child_of(4)

ampchild5=Category.create(:name => "Καμπίνες Μπάσου")		
ampchild5.move_to_child_of(4)

ampchild6=Category.create(:name => "Κιθάρας")		
ampchild6.move_to_child_of(4)

ampchild7=Category.create(:name => "Κεφαλές Κιθάρας ")		
ampchild7.move_to_child_of(4)

ampchild8=Category.create(:name => "Καμπίνες Κιθάρας")		
ampchild8.move_to_child_of(4)

ampchild9=Category.create(:name => "Πλήκτρων")		
ampchild9.move_to_child_of(4)

ampchild10=Category.create(:name => "Modeling Amps")		
ampchild10.move_to_child_of(4)


#HIFI ID=12
homeaudiochild1=Category.create(:name => "Ενισχυτές")	
homeaudiochild1.move_to_child_of(12)

homeaudiochild2=Category.create(:name => "Καλώδια")	
homeaudiochild2.move_to_child_of(12)

homeaudiochild4=Category.create(:name => "Digital Players")	
homeaudiochild4.move_to_child_of(12)

homeaudiochild9=Category.create(:name => "Equalizers")	
homeaudiochild9.move_to_child_of(12)

homeaudiochild10=Category.create(:name => "Ακουστικά")	
homeaudiochild10.move_to_child_of(12)

homeaudiochild12=Category.create(:name => "Προενισχυτές")	
homeaudiochild12.move_to_child_of(12)

homeaudiochild13=Category.create(:name => "Δέκτες")	
homeaudiochild13.move_to_child_of(12)

homeaudiochild14=Category.create(:name => "Ηχεία")	
homeaudiochild14.move_to_child_of(12)

homeaudiochild15=Category.create(:name => "Subwoofers")	
homeaudiochild15.move_to_child_of(12)

homeaudiochild16=Category.create(:name => "Μπομπινόφωνα")	
homeaudiochild16.move_to_child_of(12)

homeaudiochild20=Category.create(:name => "Κασετόφωνα")	
homeaudiochild20.move_to_child_of(12)

homeaudiochild17=Category.create(:name => "Ραδιόφωνα")	
homeaudiochild17.move_to_child_of(12)

homeaudiochild18=Category.create(:name => "Πικάπ")	
homeaudiochild18.move_to_child_of(12)

homeaudiochild19=Category.create(:name => "Εξαρτήματα και Αξεσουάρ")	
homeaudiochild19.move_to_child_of(12)


#PARTS id=14

partschild3=Category.create(:name => "Parts Ενισχυτών")	
partschild3.move_to_child_of(14)

partschild4=Category.create(:name => "Parts Μπάσου")	
partschild4.move_to_child_of(14)

partschild5=Category.create(:name => "Μαγνήτες Μπάσου")
partschild5.move_to_child_of(14)

partschild6=Category.create(:name => "Σώματα Κιθάρας")	
partschild6.move_to_child_of(14)

partschild7=Category.create(:name => "Parts Κιθάρας")	
partschild7.move_to_child_of(14)

partschild10=Category.create(:name => "Μαγνήτες Κιθάρας")	
partschild10.move_to_child_of(14)

partschild11=Category.create(:name => "Knobs")	
partschild11.move_to_child_of(14)

partschild12=Category.create(:name => "Εξαρτήματα Πεταλιών")	
partschild12.move_to_child_of(14)

partschild13=Category.create(:name => "Pickguards")	
partschild13.move_to_child_of(14)

partschild14=Category.create(:name => "Ηχεία")	
partschild14.move_to_child_of(14)

partschild15=Category.create(:name => "Λάμπες")	
partschild15.move_to_child_of(14)

partschild16=Category.create(:name => "Κλειδιά")	
partschild16.move_to_child_of(14)

partschild16=Category.create(:name => "Διάφορα")	
partschild16.move_to_child_of(14)


#DRUMS ID = 9


drumschild2=Category.create(:name => "Διάφορα Κρουστά")	
drumschild2.move_to_child_of(9)

drumschild3=Category.create(:name => "Κύμβαλα")	
drumschild3.move_to_child_of(9)

drumschild8=Category.create(:name => "Drum Machines και Samplers")
drumschild8.move_to_child_of(9)

drumschild9=Category.create(:name => "Κομμάτια Set")	
drumschild9.move_to_child_of(9)

drumschild13=Category.create(:name => "Ηλεκτρονικά Τύμπανα")	
drumschild13.move_to_child_of(9)

drumschild15=Category.create(:name => "Τύμπανα χειρός")	
drumschild15.move_to_child_of(9)

drumschild19=Category.create(:name => "Pad Controllers")	
drumschild19.move_to_child_of(9)

drumschild20=Category.create(:name => "Parts and Accessories")	
drumschild20.move_to_child_of(9)

=end
=begin



makes = Make.create([
	{name:'2box'},
{name:'3D Verlag'},
{name:'ABM'},
{name:'Accent On Music'},
{name:'Acoustic Music'},
{name:'Acoustic Music Books'},
{name:'Acus'},
{name:'Adam Hall'},
{name:'Adamas'},
{name:'ADG Productions'},
{name:'Advance Music'},
{name:'AER'},
{name:'Aguilar'},
{name:'Air Cell'},
{name:'AKG'},
{name:'Alaska'},
{name:'Alesis'},
{name:'Alfred Music Publishing'},
{name:'Allparts'},
{name:'AMA Verlag'},
{name:'thomann Amalio Burguet'},
{name:'Ampeg'},
{name:'Amsco Publications'},
{name:'AMT'},
{name:'Analog Alien'},
{name:'Angel Lopez'},
{name:'Antonio Pinto Carvalho'},
{name:'Applause'},
{name:'Aquila thomann'},
{name:'Aranjuez'},
{name:'ART'},
{name:'Artec'},
{name:'Artist Ahead Musikverlag'},
{name:'Ashdown'},
{name:'aspen pittman designs'},
{name:'AT Picks'},
{name:'Audio-Technica'},
{name:'thomann Audiowerkzeug'},
{name:'Audix'},
{name:'Augustine'},
{name:'Avalon'},
{name:'Avid'},
{name:'B-Band'},
{name:'Babicz'},
{name:'Bam'},
{name:'Bartolini'},
{name:'Baton Rouge thomann'},
{name:'BBE'},
{name:'Bedell'},
{name:'Behringer'},
{name:'Bellacura'},
{name:'Benedetto'},
{name:'BenkCube'},
{name:'Berklee Press'},
{name:'Beyerdynamic'},
{name:'Big Bends'},
{name:'thomann'},
{name:'Big Island'},
{name:'Bigsby'},
{name:'Blackstar'},
{name:'Blade'},
{name:'Blue'},
{name:'BluGuitar'},
{name:'Bogner'},
{name:'Boss'},
{name:'Bosse Verlag'},
{name:'thomann'},
{name:'Bosworth'},
{name:'Breedlove'},
{name:'Brian May'},
{name:'Broekmans & Van Poppel'},
{name:'BSM'},
{name:'BSS'},
{name:'BSX'},
{name:'Bugera'},
{name:'Bulldog'},
{name:'thomann'},
{name:'Bund Verlag'},
{name:'Burns'},
{name:'Bärenreiter'},
{name:'C-Ducer'},
{name:'C.F. Peters'},
{name:'C.Giant'},
{name:'Carisch'},
{name:'Carl Martin'},
{name:'Catalinbread'},
{name:'thomann'},
{name:'Celestion'},
{name:'Centerstream'},
{name:'Chapman Guitars'},
{name:'Charvel'},
{name:'Cherry Lane Music Company'},
{name:'Chess Tools'},
{name:'Chester Music'},
{name:'Cioks'},
{name:'thomann Clayton'},
{name:'Clearsonic'},
{name:'Cleartone'},
{name:'Clifton'},
{name:'Clover'},
{name:'Cmat Mods'},
{name:'Cocco'},
{name:'Cole Clark'},
{name:'Cooperstand'},
{name:'Cordial'},
{name:'Cordoba'},
{name:'Cort'},
{name:'Countryman'},
{name:'Crafter'},
{name:'Creative Tunings'},
{name:'Cruztools'},
{name:'CTS'},
{name:'Cuntz Guitars'},
{name:'Cyan thomann Guitars'},
{name:'D-Tar'},
{name:'Daddario'},
{name:'dAndrea'},
{name:'Danelectro'},
{name:'DAngelico'},
{name:'Darkglass'},
{name:'Dava'},
{name:'David Gage'},
{name:'De Haske thomann'},
{name:'Dean Guitars'},
{name:'Dean Markley'},
{name:'Dean Zelinsky Private Label'},
{name:'Deeflexx'},
{name:'Deering'},
{name:'Diamond'},
{name:'Diamond Guitars'},
{name:'Diezel'},
{name:'thomann'},
{name:'Digitech'},
{name:'DiMarzio'},
{name:'Dixon'},
{name:'Doblinger Musikverlag'},
{name:'Dobro'},
{name:'DPA'},
{name:'DR Strings'},
{name:'Dramatico'},
{name:'Duesenberg'},
{name:'thomann Dunlop'},
{name:'DV Mark'},
{name:'E Heinrichshofen'},
{name:'E-Bow'},
{name:'EarthQuaker Devices'},
{name:'Eastwood Guitars'},
{name:'EBS'},
{name:'Echolette'},
{name:'Eden'},
{name:'thomann'},
{name:'Edition Butterfly'},
{name:'Edition Dux'},
{name:'Edition Hanke'},
{name:'Edition Lienau'},
{name:'Edition Walhall'},
{name:'Editions Musicales Françaises'},
{name:'Egnater'},
{name:'Eich Amplification'},
{name:'thomann'},
{name:'Electro Harmonix'},
{name:'Elixir'},
{name:'EMG'},
{name:'Eminence'},
{name:'Emma'},
{name:'Empress Effects'},
{name:'Engl'},
{name:'Epiphone'},
{name:'Ergoplay'},
{name:'thomann Ernie Ball'},
{name:'Esh'},
{name:'ESP'},
{name:'EV'},
{name:'Eventide'},
{name:'Evertune'},
{name:'Evh'},
{name:'Evidence Audio'},
{name:'Evolution'},
{name:'EWS'},
{name:'Eyb'},
{name:'Faber Music'},
{name:'Fano'},
{name:'Fender'},
{name:'FGN'},
{name:'Fingerprint'},
{name:'Finhol'},
{name:'Fire & Stone'},
{name:'Fischer Amps'},
{name:'Fishman'},
{name:'Flaxwood'},
{name:'Floyd Rose'},
{name:'Fodera'},
{name:'Fostex'},
{name:'Framus'},
{name:'Francisco Domingo'},
{name:'Franz Bassguitars'},
{name:'thomann Fret King'},
{name:'Friedman Amplification'},
{name:'Fryette'},
{name:'Fuchs'},
{name:'Fulltone'},
{name:'Furch'},
{name:'FXConnectx'},
{name:'G Lab'},
{name:'G&L'},
{name:'thomann G7th'},
{name:'Gallien Krueger'},
{name:'Gator'},
{name:'Geipel'},
{name:'Geraldino Psst Music'},
{name:'Gerig Musikverlag'},
{name:'Gewa'},
{name:'Ghielmetti'},
{name:'GHS'},
{name:'thomann '},
{name:''},
{name:'Gibson'},
{name:'Gigbax'},
{name:'Gitane'},
{name:'Glockenklang'},
{name:'Godin'},
{name:'Gotoh'},
{name:'Grace Design'},
{name:'Graph Tech'},
{name:'thomann Gravity'},
{name:'Greenhouse Effects'},
{name:'Gretsch'},
{name:'Gripmaster'},
{name:'Groove Tubes'},
{name:'Grover'},
{name:'Grover Allman'},
{name:'Gruvgear'},
{name:'Guild'},
{name:'thomann Guitar Grip'},
{name:'Guitar Hanger'},
{name:'Guitar World'},
{name:'Göldo'},
{name:'Hage Musikverlag'},
{name:'Hagstrom'},
{name:'Hal Leonard'},
{name:'Hammond'},
{name:'Hanika'},
{name:'thomann'},
{name:'Hannabach'},
{name:'Harley Benton'},
{name:'Hartke'},
{name:'Haun'},
{name:'Headway'},
{name:'Helbling Verlag'},
{name:'Hellweg'},
{name:'Hercules Stands'},
{name:'Heriba'},
{name:'thomann'},
{name:'Heritage Guitar'},
{name:'Heydays'},
{name:'Hipshot'},
{name:'Hiscox'},
{name:'Hofmeister Verlag'},
{name:'Homespun'},
{name:'Honu'},
{name:'Hopf'},
{name:'Hosco'},
{name:'thomann'},
{name:'Hot Licks'},
{name:'HoTone'},
{name:'Hudson Music'},
{name:'Hughes&Kettner'},
{name:'Human Base'},
{name:'Höfner'},
{name:'Ibanez'},
{name:'IK Multimedia'},
{name:'IMP'},
{name:'thomann'},
{name:'Imua'},
{name:'ISP Technologies'},
{name:'Italia Guitars'},
{name:'J.Joye'},
{name:'Jackson'},
{name:'Jakob Winter'},
{name:'Jam Pedals'},
{name:'James Neligan'},
{name:'JBE Pickups'},
{name:'Jenschmedia'},
{name:'Jensen'},
{name:'Jet City Amplification'},
{name:'Jetslide'},
{name:'JHS Pedals'},
{name:'JJ'},
{name:'JoeMeek'},
{name:'John Hope'},
{name:'thomann'},
{name:'John Pearse'},
{name:'Jose Ribera'},
{name:'Juan Hernandez'},
{name:'K&K'},
{name:'K&M'},
{name:'Kahler'},
{name:'Kala'},
{name:'KDM Verlag'},
{name:'Keeley'},
{name:'thomann'},
{name:'Keith McMillen'},
{name:'Kemper'},
{name:'Ketteler Verlag'},
{name:'Khaya'},
{name:'KHDK'},
{name:'Kinman'},
{name:'Klark Teknik'},
{name:'Klondyke'},
{name:'Kluson'},
{name:'thomann'},
{name:'Knaggs'},
{name:'Koala Music Publications'},
{name:'Koch Amps'},
{name:'Kokio'},
{name:'Kontakt Chemie'},
{name:'Korala'},
{name:'Korg'},
{name:'Kramer Guitars'},
{name:'Kremona'},
{name:'Kumu'},
{name:'Kustom'},
{name:'Kyser'},
{name:'L.R.Baggs'},
{name:'LA Audio'},
{name:'La Bella'},
{name:'La Mancha'},
{name:'LAG'},
{name:'Lakewood'},
{name:'Lakland'},
{name:'Lala Medien'},
{name:'Laney'},
{name:'Lanikai'},
{name:'Larrivee'},
{name:'Larson Bros'},
{name:'LD Systems'},
{name:'Lead Foot'},
{name:'thomann Leewald'},
{name:'Lehle'},
{name:'Leolani'},
{name:'Leu Verlag'},
{name:'Levinson'},
{name:'Levys'},
{name:'Lindy Fralin'},
{name:'Line6'},
{name:'Little Labs'},
{name:'thomann LM'},
{name:'Lock-It'},
{name:'Logjam'},
{name:'Loog'},
{name:'Lovepedal'},
{name:'Loxx'},
{name:'Luna Guitars'},
{name:'Luthier'},
{name:'Mad Professor'},
{name:'Mahalo'},
{name:'Manuel Rodriguez'},
{name:'Marcus Miller'},
{name:'Markbass'},
{name:'Markus Setzer'},
{name:'Marleaux'},
{name:'Marshall'},
{name:'Martin Guitars'},
{name:'Marvel'},
{name:'thomann Master Artisan'},
{name:'Mastro'},
{name:'Maton'},
{name:'Maxon'},
{name:'Maxparts'},
{name:'Maxpic'},
{name:'Maybach'},
{name:'Meinl'},
{name:'Mel Bay'},
{name:'Melodie Der Welt'},
{name:'Merida'},
{name:'Mesa Boogie'},
{name:'Mey Chair Systems'},
{name:'MI-SI'},
{name:'MIDI Solutions'},
{name:'Mighty Bright'},
{name:'Millenium'},
{name:'Millennia thomann'},
{name:'Minotaur'},
{name:'Mission Engineering'},
{name:'Moen'},
{name:'Monacor'},
{name:'Monkey Banana'},
{name:'Mono Cases'},
{name:'Monster Cable'},
{name:'Montreux'},
{name:'Mooer'},
{name:'Moog'},
{name:'Morgan Amplification'},
{name:'Morley'},
{name:'MOTU'},
{name:'Music Man'},
{name:'Music Sales'},
{name:'Musikverlag Geiger'},
{name:'Musikverlag Hildner'},
{name:'thomann'},
{name:'Musikverlag Keller'},
{name:'Musikverlag Quickstep'},
{name:'MXL'},
{name:'MXR'},
{name:'National Reso-Phonic'},
{name:'NEO Instruments'},
{name:'Neotech'},
{name:'Neumann'},
{name:'Neutrik'},
{name:'thomann'},
{name:'Newmusic.Academy'},
{name:'Nobels'},
{name:'Noir By Baton Rouge'},
{name:'Novello & Co Ltd.'},
{name:'NS Design'},
{name:'OHardy Music'},
{name:'Okko'},
{name:'Oktava'},
{name:'thomann'},
{name:'One Control'},
{name:'Optima'},
{name:'Option Knobs'},
{name:'Orange'},
{name:'Orion'},
{name:'Ortega'},
{name:'Oscar Schmidt'},
{name:'Otto Musica'},
{name:'Ovation thomann'},
{name:'Palmer'},
{name:'Paramount'},
{name:'Parker'},
{name:'Partsland'},
{name:'Paulino Bernabe'},
{name:''},
{name:'Peavey'},
{name:'Pedaltrain'},
{name:'Peerless Guitars'},
{name:'thomann'},
{name:'Pensa'},
{name:'Peterson'},
{name:'Phil Jones'},
{name:'Picato'},
{name:'Pick Boy'},
{name:'Pigtronix'},
{name:'Pirastro'},
{name:'Planet Waves'},
{name:'Play-Music Publishing thomann'},
{name:'Playboy'},
{name:'Plush'},
{name:'Pomaska-Brand Verlag'},
{name:'Power Pins'},
{name:'PPV Medien'},
{name:'PRO ARTE'},
{name:'Pro Natura'},
{name:'pro snake'},
{name:'thomann'},
{name:'Proco'},
{name:'Prodipe'},
{name:'Protec'},
{name:'PRS'},
{name:'Pyramid'},
{name:'Q-Parts'},
{name:'Quercus'},
{name:'Radial Engineering'},
{name:'Raimundo'},
{name:'Rainsong'},
{name:'Ramirez'},
{name:'Randall'},
{name:'Raw Vintage'},
{name:'RC Strings'},
{name:'Recording King'},
{name:'Red Panda'},
{name:'Red Witch'},
{name:'Regal'},
{name:'thomann'},
{name:'Relish Guitars'},
{name:'Remo'},
{name:'Rene Martinez'},
{name:'Reunion Blues'},
{name:'Richter'},
{name:'Rickenbacker'},
{name:'Ricordi'},
{name:'Risa'},
{name:'Ritter'},
{name:'thomann'},
{name:'Rivera'},
{name:'Riversong'},
{name:'Rockbag'},
{name:'Rockboard'},
{name:'Rockcase'},
{name:'Rockett'},
{name:'RockNRoller'},
{name:'Rockstand'},
{name:'Rocktron'},
{name:'Rockys thomann'},
{name:'Rode'},
{name:'Rodenberg'},
{name:'Roger Linn Design'},
{name:'Roger Mayer'},
{name:'Roland'},
{name:'Rolls'},
{name:'Romana'},
{name:'Romero by La Mancha'},
{name:'thomann'},
{name:'Rotosound'},
{name:'Rubner'},
{name:'Ruby Tubes'},
{name:'Rupert Neve Designs'},
{name:'Sadowsky'},
{name:'Samson'},
{name:'Sandberg'},
{name:'Santo Angelo'},
{name:'Savarez'},
{name:'thomann'},
{name:'Schaller'},
{name:'Schatten Design'},
{name:'Schecter'},
{name:'Schell Music'},
{name:'Schertler'},
{name:'Schott'},
{name:'Schuh Verlag'},
{name:'Sennheiser'},
{name:'Seymour Duncan thomann'},
{name:'Shadow'},
{name:'Sharkfin'},
{name:'Shubb'},
{name:'Shure'},
{name:'SIB'},
{name:'Singular Sound'},
{name:'Sirus Pro'},
{name:'SIT'},
{name:'SKB'},
{name:'thomann'},
{name:'Snark'},
{name:'Solid Gold FX'},
{name:'SoloDallas'},
{name:'Sommer Cable'},
{name:'Sonifex'},
{name:'Sonuus'},
{name:'Source Audio'},
{name:'Sovtek'},
{name:'Spector thomann'},
{name:'Sperzel'},
{name:'SPL'},
{name:'St.Blues'},
{name:'Stageclix'},
{name:'Stagetrix'},
{name:'Stagg'},
{name:'Stairville'},
{name:'Standback'},
{name:'Stanford'},
{name:'thomann Startone'},
{name:'Stefan Grossmans Guitar Works'},
{name:'Stefan Roessler'},
{name:'Steinberger Guitars'},
{name:'Sterling by Music Man'},
{name:'Stetsbar'},
{name:'Stiftung Dacapo'},
{name:'Streetlife Music'},
{name:'thomann'},
{name:'String Tie'},
{name:'Strymon'},
{name:'Subdecay'},
{name:'Suhr'},
{name:'Super Vee'},
{name:'Superlux'},
{name:'Supro'},
{name:'Switchcraft'},
{name:'T-Rex'},
{name:'thomann'},
{name:'TAD'},
{name:'Takamine'},
{name:'Tanglewood'},
{name:'TAP'},
{name:'Tascam'},
{name:'Taylor'},
{name:'TC Electronic'},
{name:'TC-Helicon'},
{name:'TecAmp'},
{name:'Tech 21'},
{name:'Temple Audio Design'},
{name:'Teye Guitars'},
{name:'the box'},
{name:'The Loar'},
{name:'the sssnake'},
{name:'the t.bone'},
{name:'the t.racks'},
{name:'thomann Thomann'},
{name:'Thomastik'},
{name:'Thon'},
{name:'Timber Tones'},
{name:'Titebond Glue'},
{name:'Tokai Guitars'},
{name:'Tom and Will'},
{name:'Tonegear'},
{name:'TonePros'},
{name:'thomann'},
{name:'Traben'},
{name:'Trace Elliot'},
{name:'Traveler Guitars'},
{name:'Tronical'},
{name:'Truetone'},
{name:'Tube Amp Doctor'},
{name:'Tube Amp Manufactur'},
{name:'Tunesday Records'},
{name:'thomann'},
{name:'Tung-Sol'},
{name:'TV Jones'},
{name:'Two Notes'},
{name:'Two Rock'},
{name:'Ultimate'},
{name:'Universal Edition'},
{name:'V-Picks'},
{name:'Valeton'},
{name:'Van Damme thomann Cable'},
{name:'Velcro'},
{name:'Verlag Hubertus Nogatz'},
{name:'Vermona'},
{name:'VGS'},
{name:'VHT'},
{name:'Vibramate'},
{name:'Victory Amplifiers'},
{name:'Vintage'},
{name:'Visual Sound'},
{name:'Voggenreiter'},
{name:'Volonte & Co'},
{name:'Voodoo Lab'},
{name:'Vovox'},
{name:'Vox'},
{name:'Walrus Audio'},
{name:'Wampler'},
{name:'Warner Bros.'},
{name:'thomann'},
{name:'Warwick'},
{name:'Way Huge'},
{name:'Weehbo'},
{name:'Weinberger Musikverlag'},
{name:'Whirlwind'},
{name:'Wiley Publishing'},
{name:'Wiley-Vch'},
{name:'Wilkinson'},
{name:'Winner'},
{name:'thomann'},
{name:'Wise Publications'},
{name:'Wittner'},
{name:'Woodies'},
{name:'Wylde Audio'},
{name:'Xotic'},
{name:'XVive'},
{name:'Yamaha'},
{name:'You Rock Guitar'},
{name:'Z.Vex thomann'},
{name:'Zemaitis'},
{name:'Zivix'}
])



=end

