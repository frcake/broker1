class Classified < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :photos, dependent: :destroy, inverse_of: :classified

  has_many :favorite_classifieds, dependent: :destroy
  has_many :favorited_by, through: :favorite_classifieds, source: :user, dependent: :destroy # for the favorite_by to work :source is needed
  has_many :flags, dependent: :destroy
  has_many :flagged_by, through: :flags, source: :user, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  monetize :price_cents

  # validates :giveaway ,:presence => true, :unless => :sell?
  validate :classified_cant_be_giveaway_and_sell
  validate :classified_cant_be_askingfor_and_sell

  searchable do
    text :title, boost: 5
    text :model, :created_month, :make, :make_country, :condition, :cat, :price # TO BE CHANGED TO CURRENCY FORMAT
    # text :treecat #, :multiple => true
    time :created_at
    integer :categoryid

    string :treecat, multiple: true
    string :price # TO BE CHANGED TO CURRENCY FORMAT
    string :created_month
    string :cat
    string :make_country
    string :condition
    string :make
    string :model
    integer :price
    boolean :giveaway
    boolean :sell
    boolean :trade
    boolean :askingfor
  end

  def cat
    category.root.name
  end

  def treecat
    category.name unless category.name == category.root.name
  end

  def categoryid
    category.id
  end

  def created_month
    created_at.strftime('%d/%m/%y')
  end

  def classified_cant_be_giveaway_and_sell
    if giveaway? && sell?
      errors.add(:giveaway, 'Μια αγγελία δεν μπορεί να είναι ταυτόχρονα για πώληση και ανταλλαγή!')
    end
  end

  def classified_cant_be_askingfor_and_sell
    if askingfor? && sell?
      errors.add(:askingfor, 'Μια αγγελία δεν μπορεί να είναι ταυτόχρονα για πώληση και ζήτηση!')
    end
  end
end

CONDITIONS = ['Καινούριο', 'Άψογη', 'Πολύ καλή', 'Καλή', 'Χρησημοποιημένο', 'Λειτουργικό', 'Για εξαρτήματα'].freeze

COUNTRIES = ['USA',
             'Canada',
             'England',
             'Australia',
             'France',
             'Germany',
             'Japan',
             'Russia',
             'Indonesia',
             'Afghanistan',
             'Albania',
             'Algeria',
             'American Samoa',
             'Andorra',
             'Angola',
             'Anguilla',
             'Antigua and Barbuda',
             'Argentina',
             'Armenia',
             'Aruba',
             'Australia',
             'Austria',
             'Azerbaijan',
             'Bahamas',
             'Bahrain',
             'Bangladesh',
             'Barbados',
             'Belarus',
             'Belgium',
             'Belize',
             'Benin',
             'Bermuda',
             'Bhutan',
             'Bolivia',
             'Bosnia and Herzegovina',
             'Bouvet Island',
             'Brazil',
             'Brunei Darussalam',
             'Bulgaria',
             'Burkina Faso',
             'Burundi',
             'Cambodia',
             'Cameroon',
             'Canada',
             'Cape Verde',
             'Cayman Islands',
             'Chad',
             'Chile',
             'China',
             'Christmas Island',
             'Colombia',
             'Comoros',
             'Congo',
             'Costa Rica',
             'Croatia',
             'Cuba',
             'Curaçao',
             'Cyprus',
             'Czech Republic',
             'Côte d Ivoire',
             'Denmark',
             'Djibouti',
             'Dominica',
             'Dominican Republic',
             'Ecuador',
             'Egypt',
             'El Salvador',
             'Equatorial Guinea',
             'Eritrea',
             'Estonia',
             'Ethiopia',
             'Finland',
             'France',
             'Gabon',
             'Gambia',
             'Georgia',
             'Germany',
             'Ghana',
             'Gibraltar',
             'Greece',
             'Greenland',
             'Grenada',
             'Guadeloupe',
             'Guam',
             'Guatemala',
             'Guernsey',
             'Guinea',
             'Guyana',
             'Haiti',
             'Honduras',
             'Hong Kong',
             'Hungary',
             'Iceland',
             'India',
             'Indonesia',
             'Iran',
             'Iraq',
             'Ireland',
             'Isle of Man',
             'Israel',
             'Italy',
             'Jamaica',
             'Japan',
             'Jersey',
             'Jordan',
             'Kazakhstan',
             'Kenya',
             'Kiribati',
             'Korea',
             'Kuwait',
             'Kyrgyzstan',
             'Latvia',
             'Lebanon',
             'Lesotho',
             'Liberia',
             'Libya',
             'Liechtenstein',
             'Lithuania',
             'Luxembourg',
             'Macao',
             'Macedonia',
             'Madagascar',
             'Malawi',
             'Malaysia',
             'Maldives',
             'Mali',
             'Malta',
             'Marshall Islands',
             'Martinique',
             'Mauritania',
             'Mauritius',
             'Mayotte',
             'Mexico',
             'Micronesia',
             'Moldova',
             'Monaco',
             'Mongolia',
             'Montenegro',
             'Montserrat',
             'Morocco',
             'Mozambique',
             'Myanmar',
             'Namibia',
             'Nauru',
             'Nepal',
             'Netherlands',
             'New Caledonia',
             'New Zealand',
             'Nicaragua',
             'Niger',
             'Nigeria',
             'Norway',
             'Oman',
             'Pakistan',
             'Palau',
             'Palestine',
             'Panama',
             'Papua New Guinea',
             'Paraguay',
             'Peru',
             'Philippines',
             'Pitcairn',
             'Poland',
             'Portugal',
             'Qatar',
             'Romania',
             'Russia',
             'Rwanda',
             'Réunion',
             'Samoa',
             'San Marino',
             'Saudi Arabia',
             'Senegal',
             'Serbia',
             'Seychelles',
             'Sierra Leone',
             'Singapore',
             'Slovakia',
             'Slovenia',
             'Solomon Islands',
             'Somalia',
             'South Africa',
             'South Sudan',
             'Spain',
             'Sri Lanka',
             'Sudan',
             'Suriname',
             'Svalbard and Jan Mayen',
             'Swaziland',
             'Sweden',
             'Switzerland',
             'Syrian Arab Republic',
             'Taiwan',
             'Tajikistan',
             'Thailand',
             'Timor-Leste',
             'Togo',
             'Tokelau',
             'Tonga',
             'Tunisia',
             'Turkey',
             'Turkmenistan',
             'Tuvalu',
             'Uganda',
             'Ukraine',
             'United Arab Emirates',
             'Uruguay',
             'Uzbekistan',
             'Vanuatu',
             'Venezuela',
             'Vietnam',
             'Wallis and Futuna',
             'Western Sahara',
             'Yemen',
             'Zambia',
             'Zimbabwe',
             'Åland Islands'].freeze

BRANDS = [
  '1stClassRock',
  '2box',
  '2nd Sense Audio',
  '3D Verlag',
  '9.solutions',
  'A-Gift-Republic',
  'AA Craaft',
  'Ableton',
  'ABRSM Publishing',
  'Acama',
  'Accent On Music',
  'Access',
  'Accu-Case',
  'ACM Verlag',
  'ACME Audio',
  'Acme',
  'Acousta Grip',
  'Acoustic Image',
  'Acoustic Music Books',
  'Acoustic Music',
  'Acus',
  'Adam Hall',
  'Adam',
  'Adams',
  'ADG Productions',
  'ADJ',
  'Adler Heinrich',
  'Advance Music',
  'AER',
  'Aerodrums',
  'AFMG',
  'African Percussion',
  'Afroton',
  'Agner',
  'Aguilar',
  'Ahead',
  'AIAIAI',
  'Air Cell',
  'AIR Music Technology',
  'Airturn',
  'Aizen',
  'AJH Synth',
  'AK Drums',
  'Akai',
  'AKG by Harman',
  'AKG',
  'Alan',
  'Albrecht',
  'Alesis',
  'Alexander',
  'Alfons Neumann',
  'Alfred Music Publishing',
  'Alfred Stingl by Höfner',
  'Allen & Heath',
  'Alliance',
  'Allparts',
  'Allton',
  'AllyourCable',
  'Alpine Mute',
  'Alpine',
  'Alps',
  'Alto',
  'Altus',
  'Alva',
  'AMA Verlag',
  'Ambassador',
  'AMEK',
  'American Audio',
  'Ampeg',
  'Ampetronic',
  'Amphenol',
  'Ample Sound',
  'AMS Neve',
  'Amsco Publications',
  'AMT',
  'Analogue Solutions',
  'Anatolian',
  'Andexinger',
  'Andrea',
  'Andreas Hambsch',
  'Anka Verlag',
  'Ansmann',
  'Antares',
  'Antari',
  'Antelope',
  'Antonio Pinto Carvalho',
  'Äolis Klangspiele',
  'Apart',
  'Ape Labs',
  'Aphex',
  'API Audio',
  'Apogee',
  'Apple',
  'Applied Acoustics Systems',
  'Applied Microphone Technology',
  'Aquarian',
  'Aquila',
  'AQVOX',
  'ARP',
  'ARRI',
  'Art of Music',
  'ART',
  'Artec',
  'Artino',
  'Artist Ahead Musikverlag',
  'Arturia',
  'Arundos',
  'ASA',
  'Ashdown',
  'Asian Sound',
  'ASL Intercom',
  'aspen pittman designs',
  'AT Picks',
  'Atlantic Music',
  'Aubert',
  'Audient',
  'Audio Technica',
  'Audio Workshop',
  'Audio-Technica',
  'Audioease',
  'AudioInnovate',
  'Audiowerkzeug',
  'Audix',
  'August Richard Hammig',
  'Aulos',
  'Auralex Acoustics',
  'Auris',
  'Austin Custom Brass',
  'AV Stumpfl',
  'Avalon',
  'Avantone',
  'Avid',
  'Avolites',
  'AW Reeds',
  'Axis Percussion',
  'Axxent',
  'Azumi',
  'B-Band',
  'B.Air',
  'B.E.K.',
  'B.E.R.P.',
  'B&C',
  'B&O Play',
  'B&S',
  'Bach',
  'Backbeat Books',
  'Baff',
  'Baltes',
  'Bam',
  'Bandshop',
  'Bärenreiter',
  'Basix',
  "Bass Drum O's",
  'Baton Rouge',
  'Bazzini',
  'BBE',
  'Beat Root',
  'Beatnicker',
  'Beatnik',
  'Bechstein',
  'Behringer',
  'Belaieff Musikverlag',
  'Belden',
  'Bellacura',
  'Berg Larsen',
  'Bergerault',
  'Berklee Press',
  'Berolina Manufaktur',
  'Besson',
  'Best Brass',
  'Best Service',
  'Beyerdynamic',
  'Beyma',
  'BG',
  'Big Fat Snare Drum',
  'Billaudot Editeur',
  'Bischoff Verlag',
  'Bittner',
  'Black Swamp Percussion',
  'Blackmagic Design',
  'Blackstar',
  'Blechpresse Verlag',
  'Blocki',
  'Blue',
  'BluGuitar',
  'Blüthner',
  'BMS',
  'Bo Pep',
  'Bob Reeves',
  'Bobcat',
  'BOLD',
  'Bondix',
  'Bonmusica',
  'Boomwhackers',
  'Boosey & Hawkes',
  'Borgani',
  'Bosch',
  'Boschma Cases',
  'Bose',
  'Boss',
  'Bosse Verlag',
  'Bosworth',
  'Bötels',
  'Botex',
  'Bow Brand',
  'Brand',
  'Brass Bags',
  'Breathtaking',
  'Breitkopf & Härtel',
  'Bremner',
  'Breslmair',
  'Bricasti Design',
  'Brillant',
  'Broekmans & Van Poppel',
  'Bruno Tilz',
  'Bruno Uetz Musikverlag',
  'BSS',
  'BSX',
  'Buffet Crampon',
  'Buffet',
  'Bugera',
  'Bulgheroni',
  'Bulldog',
  'Bund Verlag',
  'Burghardt',
  'Burns',
  'Buso Audio',
  'C-Ducer',
  'C:DIX',
  'C.A. Seydel Söhne',
  'C.F. Peters',
  'C.F. Schmidt Musikverlag',
  'C.G.Conn',
  'C.Giant',
  'Cableguys',
  'Cajon-Direkt',
  'Cakewalk',
  'Cameo',
  'Canadian Brass',
  'Carbondix',
  'Carisch',
  'Carl Fischer',
  'Carl Martin',
  'Carol Brass',
  'Casio',
  'CAZZ Snare',
  'Cebulla',
  'Celestion',
  'CelloSticker',
  'Centerstream',
  'Cerveny',
  'Chameleon',
  'ChamSys',
  'Chandler Limited',
  'Charles Colin Music',
  'Cherry Lane Music Company',
  'Chess Tools',
  'Chester Music',
  'Chop Saver',
  'Christian Lindberg',
  'Christoph Heftrig',
  'Christopher',
  'Cinematique Instruments',
  'Cioks',
  'Clarke',
  'Classic Line',
  'Claude Lakey',
  'Clavia Nord',
  'Clearsonic',
  'Clicktronic',
  'CME',
  'CodaMusic',
  'Coles',
  'Colour Your Drum',
  'Community',
  'Comply',
  'ConBrio Verlag',
  'Concab',
  'Conrad Götz',
  'Contemporanea',
  'Contribe',
  'Cooperstand',
  'Cordial',
  'Cordier',
  'Corelli',
  'Cotton Music',
  'Countryman',
  'Crane Song',
  'Crestron',
  'Crown By Larsen',
  'Crown',
  'Crumar',
  'Cruztools',
  'CSM',
  'Cuelux',
  'Curnow Music',
  'Cympad',
  'Cyrill Harnischmacher',
  "D'Addario Woodwinds",
  'D&R',
  'Daddario',
  'Damar & Hagen',
  'Dampit',
  'dAndrea',
  'Danelectro',
  'Dangerous Music',
  'Danmar',
  'Dante Agostini',
  'Daslight',
  'Dateq',
  'Dave Smith Instruments',
  'David Gage',
  'db loops',
  'dB Technologies',
  'DBX',
  'DDA',
  'DDrum',
  'ddt',
  'De Haske',
  'Dean Guitars',
  'Decksaver',
  'Decotruss',
  'Deering',
  'Delock',
  'Denis Wick',
  'Denon',
  'Design-Studio Worms',
  'Despiau',
  'DG De Gregorio',
  'Diamond Guitars',
  'Dictum',
  'Dieter Otto',
  'Digital Sound',
  'Digitech',
  'Dimbath',
  'DirectOut',
  'Dixon',
  'DJ Power',
  'DJ Techtools',
  'Djembe-Percussion',
  'DNH',
  'Doblinger Musikverlag',
  'Doepfer',
  'Dogal',
  'Dorazio',
  'Dörfler',
  'Dotzauer',
  'Doughty',
  'Dover Publications',
  'DPA',
  'Dragao',
  'Dramatico',
  'Drawmer',
  'Dreadbox',
  'DrumDial',
  'Drumlite',
  'Drumport World Percussion',
  'Drumport',
  'Drums and More',
  'DTS',
  'Duallist',
  'Dübreq',
  'Duesenberg',
  'Duke',
  'Dunlop',
  'Duratruss',
  'DV Mark',
  'DVD Lernkurs',
  'DVFM Verlag',
  'DW',
  'Dycem',
  'Dynacord',
  'E Heinrichshofen',
  'E-RM',
  'Earsonics',
  'Earthworks Audio',
  'EastWest',
  'EBS',
  'Echo Musikverlag',
  'Echter Verlag',
  'Ecler',
  'Eclipse',
  'Eden',
  'Edgar Russ',
  'Edition Butterfly',
  'Edition Dux',
  'Edition Hanke',
  'Edition Hug',
  'Edition Lienau',
  'Edition Melodie',
  'Edition Metropol',
  'Edition Moeck',
  'Edition Musica Budapest',
  'Edition Wächtler',
  'Edition Walhall',
  'Edition Walter Wild',
  'Editions Bim',
  'Editions Bourges R.',
  'Editions Musicales Françaises',
  'Editions Paul Beuscher',
  'Editions Salabert',
  'Editortasten',
  'Eduard Seiler',
  'Edwards',
  'Efrano',
  'Ehrgeiz',
  'Eich Amplification',
  'Eighteensound',
  'Elacin',
  'Electro Harmonix',
  'Elektor Verlag',
  'Elektron',
  'Elysia',
  'EMD',
  'Emerald',
  'Eminence',
  'Emma',
  'EMO',
  'Empirical Labs',
  'Endorphin.es',
  'Engl',
  'Enttec',
  'Epiphone',
  'epubli GmbH',
  'Ergonomic Systems',
  'Ernie Ball',
  'Ernst Heinrich Roth',
  'ESI',
  'ESM Ernst Schreiber',
  'ESP',
  'ETC',
  'Etymotic',
  'Eurographics',
  'Eurolite',
  'EV',
  'Evans',
  'Eventide',
  'Everest',
  'Evh',
  'Evidence Audio',
  'Evolution Series',
  'Explorer Cases',
  'Expolite',
  'Extreme Isolation',
  'Extron',
  'F.A. Uebel',
  'Faber Music',
  'Fane',
  'Fantek',
  'Fat Cat',
  'Fatar',
  'FBT',
  'Fender',
  'Ferrofish',
  'FF Fortissimo',
  'Fibracell',
  'Fingerprint',
  'Finhol',
  'Fire & Stone',
  'First Frets',
  'Fischer Amps',
  'Fishman',
  'Fismen',
  'Fisoma',
  'Flexibrass',
  'Flix',
  'Flyht Pro',
  'FMR Audio',
  'Focal',
  'Focusrite',
  'Forestone',
  'Formula Sound',
  'Fostex',
  'Framus',
  'Francois Louis',
  'Franz Sandner',
  'Fredenstein',
  'Frederick L. Hemke',
  'Friedrich Hofmeister Verlag',
  'Friendchip',
  'Frind',
  'Fulltone',
  'Fun Generation',
  'Furman',
  'Futurelight',
  'FXpansion',
  'G Lab',
  'G. Schirmer',
  'Gaffgun',
  'Galileo',
  'Gallien Krueger',
  'Gard',
  'Gary Garritan',
  'Gator',
  'Gauger Percussion',
  'GC Carstensen Verlag',
  'GE Lighting',
  'ge-gra-Muster',
  'Gebrüder Mönnig',
  'Geipel',
  'Gemini',
  'Genelec',
  'Geraldino Psst Music',
  'Gerband',
  'Gerd Dowids',
  'Gerig Musikverlag',
  'German Maestro',
  'Getzen',
  'Gewa',
  'GF',
  'Ghielmetti',
  'GHS',
  'Gibraltar',
  'Gibson',
  'Gigbax',
  'Gira',
  'Gitane',
  'GitarrenTheorie GT',
  'Glasser',
  'Global Truss',
  'Glockenklang',
  'Glorious',
  'GLP',
  'Goldon',
  'Gon Bops',
  'Gonzalez',
  'GoPro',
  'Gotoh',
  'Gottsu',
  'Götz',
  'Grace Design',
  'Gravity',
  'Great River',
  'Gretel Musikverlag',
  'Gretsch',
  'Griego Mouthpieces',
  'Grover Allman',
  'Grover Pro Percussion',
  'Gruvgear',
  'Guitar Grip',
  'Guitar Hanger',
  'Guitar World',
  'Guntram Wolf',
  'Gut-a-Like',
  'Haessler',
  'Hage Musikverlag',
  'Hagerty',
  'Hagstrom',
  'Haken Audio',
  'Hal Leonard',
  'Hama',
  'Hammond',
  'Hanbooks',
  'Hanika',
  'Hannabach',
  'Hans Hoyer',
  'Hansepercussion',
  'Hardcase',
  'Harley Benton',
  'Harman Kardon',
  'Harmon',
  'Harry Hartmann',
  'Harting',
  'Hartke',
  'Haun',
  'Haynes Publishing',
  'Headway',
  'Hearsafe',
  'Heil Sound',
  'Helbling Verlag',
  'Hellermann',
  'Hemingway',
  'Henle Verlag',
  'Herbert Neureiter',
  'Herco',
  'Hercules Stands',
  'Heriba',
  'Hering',
  'Heritage Audio',
  'Hetman',
  'Hey!blau',
  "Heyday's",
  'HH',
  'Hicon',
  'Hidersine',
  'Hieber Verlag',
  'Hipshot',
  'Hiscox',
  'HK Audio',
  'Hofmeister Verlag',
  'Höfner',
  'Hohner Verlag',
  'Hohner',
  'Hokema',
  'Holton',
  'Holz-Frank',
  'Holzschuh Verlag',
  'Homespun',
  'Hopf',
  'Horst Rapp Verlag',
  'Hosa',
  'Hosco',
  'Hot Licks',
  'HoTone',
  'House of Marley',
  'Hudson Music',
  'Hughes&Kettner',
  'Humanscale',
  'Humes & Berg',
  'Ian Bousfield',
  'Ibanez',
  'iConnectivity',
  'Ignition',
  'IGS Audio',
  'IK Multimedia',
  'Image-Line',
  'IMP',
  'InEar',
  'Innovation',
  'Innovative Percussion',
  'Inter-M',
  'International Music Company',
  'Intricon',
  'ION Audio',
  'Irmler',
  'Istanbul Agop',
  'Istanbul Mehmet',
  'iZotope',
  'J.R. Publications',
  'Jackson',
  'Jaeger',
  'Jäger',
  'Jahn',
  'Jakob Winter',
  'Jam',
  'Jamey Aebersold',
  'JamHub',
  'Jargar',
  'Jaspers',
  'Jazzlab',
  'JB-Lighting',
  'JBL by Harman',
  'JBL',
  'JEM',
  'Jenschmedia',
  'Jensen',
  'Jerome Callet',
  'Jet Tone',
  'JK',
  'Jo-Ral',
  'Jody Jazz',
  'JoeMeek',
  'Johannes Bornmann',
  'Johannes Gerhard Hammig',
  'Johannes Scherzer',
  'John Pearse',
  'Jomox',
  'Jones',
  'Josef Lidl',
  'Jupiter',
  'JVC',
  'JW-eastman',
  'K&K',
  'K&M',
  'Kala',
  'Kalfo',
  'Kampana',
  'Kanstul',
  'Kapego',
  'Kariso',
  'Karl Höfner',
  'Kärntnerland',
  'KAT',
  'Kaufmann',
  'Kawai',
  'KDM Verlag',
  'Keilwerth',
  'Keith McMillen',
  'Kelly Shu',
  'Kemper',
  'Kenton',
  'Kenwood',
  'Ketron',
  'Ketteler Verlag',
  'Kevin Mayhew',
  'Kick Port',
  'King',
  'Kintail',
  'Kirchhoff',
  'Klang-Bude 43',
  'KLANG:technologies',
  'Klanginitiative Percussion',
  'Klark Teknik',
  'Klaus Heffler',
  'Klavicura',
  'Klawus',
  'Klemm Music',
  'Klondyke',
  'Klotz',
  'KME',
  'Knöpferl-Musikverlag',
  'Knosti',
  'Koala Music Publications',
  'Koch Amps',
  'Kolberg',
  'Kölbl',
  'Kolstein',
  'Könitz',
  'Konstant Software',
  'Kontakt Chemie',
  'Korg pro',
  'Korg',
  'Koshi',
  'Kramer',
  'Kreul',
  'KRK',
  'KS Audio',
  'Kühnl & Hoyer',
  'Kun',
  'Kunath',
  'Küng',
  'Kurzweil',
  'KuSh Audio',
  'Kustom',
  'L.R.Baggs',
  'LA Audio',
  'La Bella',
  'La Tromba',
  'La Voz',
  'LAB Gruppen',
  'Lake People',
  'Lala Medien',
  'Laney',
  'Lanikai',
  'Lapella',
  'Larsen',
  'Laserworld',
  'LD Systems',
  'Lead Foot',
  'Leather Specialties',
  'Leatherman',
  'Leblanc USA',
  'Leblanc',
  'LED Lenser',
  'Lee Oskar',
  'Lee',
  'Lefima',
  'Legere',
  'Lehle',
  'Lehmann Audio',
  'Leitner & Kraus',
  'Lenzner',
  'Leopold Müller',
  'Leu Verlag',
  'Leuchtturm 1917',
  'LeuWa-Verlag',
  'Lewitt',
  'Lexicon',
  'LG',
  'Libero',
  'Liebenzeller',
  'Lindell Audio',
  'Lindy',
  'Line6',
  'Liquid Light Acoustics',
  'Litecraft',
  'Little Labs',
  'Littlite',
  'Livid',
  'Logjam',
  'Look',
  'LP',
  'LSC',
  'Ludwig Music',
  'Ludwig',
  'Lugert Verlag',
  'Luke',
  'Lumberg',
  'LupX',
  'Luthier',
  'Lynx Studio',
  'Lyon & Healy',
  'M-Audio',
  'MA Lighting',
  'Mach One',
  'Mackie',
  'Magix',
  'Magma',
  'Magnat',
  'Mahalo',
  'Maintronic',
  'Major',
  'MakeMusic',
  'Malletech',
  'MAM',
  'Manfrotto',
  'Manhasset',
  'Manikin-Electronic',
  'Manley',
  'Mapex',
  'Marantz',
  'Marca',
  'Marcinkiewicz',
  'Marcus Bonna',
  'Marcus Miller',
  'Marian',
  'Marienberg Devices',
  'Marimba One',
  'Mark Drum',
  'Markbass',
  'Markus Arnold',
  'Markus Setzer',
  'Marshall',
  'Martin Koch',
  'Martin',
  'Masshoff Drums',
  'Masterwork',
  'Mastro',
  'Matsikas',
  'Matthias Kraft Verlag',
  'Maxell',
  'Maxparts',
  'Maxpic',
  'McDSP',
  'MeanWell',
  'MEB',
  'Meck Verlag',
  'MediaLas',
  'Meerklang',
  'Meinel',
  'Meinl',
  'Mel Bay',
  'Mellotron',
  'Melodie Der Welt',
  'Melton',
  'Memminger',
  'Mennekes',
  'Mesa Boogie',
  'Metal Sounds',
  'Metarex',
  'Metric Halo',
  'Metrophones',
  'Mey Chair Systems',
  'MFB',
  'MI-SI',
  'Michael Glass',
  'Michael Rath',
  'micW',
  'Midas',
  'MIDI Solutions',
  'Midiland',
  'Miditech',
  'Miditemp',
  'Midland',
  'Mighty Bright',
  'Mike Balter',
  'Mike McLean Mutes',
  'Miktek',
  'Millant-Deroux',
  'Millenium PARTS',
  'Millenium',
  'Millennia',
  'Minotaur',
  'Miraphone',
  'Mitchell Lurie',
  'mitp Verlag',
  'Mitropa Music',
  'Mixars',
  'MixVibes',
  'Miyazawa',
  'Modartt',
  'Mode Machines',
  'Moeck',
  'Mojave',
  'Mollard',
  'Mollenhauer',
  'Monacor',
  'Monkey Banana',
  'Mono Cases',
  'Monster Cable',
  'Monster Oil',
  'Monster',
  'Montarbo',
  'Mooer',
  'Moog',
  'Morley',
  'Möseler Verlag',
  'Moser',
  'Mott',
  'MOTU',
  'Moxa',
  'Mu Technologies',
  'Muco',
  'Mundorgel Verlag',
  'Muramatsu',
  'Music Gift',
  'Music Man',
  'Music Minus One',
  'Music Sales',
  'MusicLab',
  'Musik & Geisteswerte Verlag',
  'Musik Total',
  'Hahn',
  'Chili Notes',
  'Geiger',
  'Heinlein',
  'Hildner',
  'Josef Preißler',
  'Keller',
  'Preissler',
  'Quickstep',
  'Raisch',
  'Richard Birnbach',
  'Rundel',
  'Schweizer',
  'Tastenzauber',
  'Wilhelm Halter',
  'Musilia',
  'Musitek',
  'Musser',
  'Mutec',
  'MXL',
  'MXR',
  'Myers Pickups',
  'Nadir',
  'National Reso-Phonic',
  'Native Instruments',
  'Negri',
  'Neil A.Kjos Music Company',
  'Nektar',
  'NEO Instruments',
  'Neotech',
  'Neukubra',
  'Neumann',
  'Neuratron',
  'Neutrik',
  'Newmusic.Academy',
  'Nici',
  'Nino',
  'NMB',
  'Noble & Cooley',
  'Nomad Factory',
  'Notaflex',
  'Nova',
  'Novation',
  'Novello & Co Ltd.',
  'Nowsonic',
  'NS Design',
  'NTI Audio',
  'Numark',
  'Oehlbach',
  'OHardy Music',
  'Ohm',
  'Oktava',
  'Olympus',
  'Omnibus Press',
  'Omnilux',
  'One Control',
  'One Systems',
  'Opti-Care',
  'Optima',
  'Orange',
  'Orla',
  'Ortega',
  'Ortofon',
  'Ortola',
  'Oscar Adler & Co.',
  'Oscar Schmidt',
  'Osram',
  'Otto Jos. Klier',
  'Otto Junne Verlag',
  'Otto Link',
  'Otto Musica',
  'Output',
  'Ovation',
  'Overloud',
  'Oxford University Press',
  'P.Mauriat',
  'Pace',
  'Paetzold by Kunath',
  'Pageflip',
  'Paiste',
  'Palmer',
  'Pangolin',
  'Papst',
  'PAS',
  'Patchblocks',
  'Paul C.R. Arends Verlag',
  'Paulus & Schuler GbR',
  'Pauly',
  'pBone',
  'Pearl Flutes',
  'Pearl',
  'Peavey',
  'Pedaltrain',
  'Pedi',
  'Peermusic',
  'Peli',
  'Peltor',
  'Peluso',
  'Pendim',
  'Pepote',
  'Perantucci',
  'Peter Gane',
  'Peter Hess',
  'Peter Lamprecht',
  'Peter Ponzol',
  'Peterson',
  'Petz',
  'Pflaumer',
  'PG Music',
  'Phil Jones',
  'Philipp Hammig',
  'Philips',
  'Philipzen Percussion',
  'Phonic',
  'Physis Piano',
  'Piattino',
  'Picato',
  'Pick Boy',
  'Pigtronix',
  'Pilgerstorfer',
  'Pinguin',
  'Pioneer',
  'Pirastro',
  'Pisoni',
  'Pittsburgh Modular',
  'Planet Waves',
  'Plaschke',
  'Play-Music Publishing',
  'Playonair',
  'Playwood',
  'Pokket',
  'Pöltl',
  'Polymnia Press',
  'Pomarico',
  'Pomaska-Brand Verlag',
  'Porter & Davies',
  'POWERbreathe',
  'Powersoft',
  'Powerstopf',
  'PPV Medien',
  'Precieux',
  'Precision Devices',
  'Premier',
  'Presonus',
  'Prestini',
  'Presto',
  'Prim',
  'Prism Sound',
  'Pro Mark',
  'pro snake',
  'Proco',
  'Prodector',
  'Prodipe',
  'Prof. W. Hilgers',
  'Project Sam',
  'Propellerhead',
  'Protec',
  'PRS',
  'Punchlight',
  'PUR',
  'Puresound',
  'Purzelbaum Verlag',
  'Pyramid',
  'Q-Max',
  'QSC',
  'Quercus',
  'Quickstart Verlag',
  'Radial Engineering',
  'Radian',
  'Radikal Technologies',
  'Rainbow',
  'Ramirez',
  'Rampone & Cazzani',
  'Rane',
  'RATstands',
  'RC Strings',
  'RCF',
  'RCS',
  'RDM',
  'Regal Tip',
  'Reka',
  'Reloop',
  'Remo',
  'Renkus Heinz',
  'Resonans',
  'Reunion Blues',
  'Reutlinger',
  'Richard Stegmann',
  'Richter',
  'Rickenbacker',
  'Rico',
  'Ricordi',
  'RiedConn',
  'Riedl',
  'Ries und Erler Musikverlag',
  'Rigoutat',
  'Rillion',
  'Risa',
  'Rising Software',
  'Ritter',
  'Rivera',
  'RME',
  'RMG',
  'Rob Papen',
  'Robert Juliat',
  'Roché Thomas',
  'Rock You',
  'Rockbag',
  'Rockboard',
  'Rockcase',
  'Rocknet',
  'RockNRoller',
  'Rockruepel',
  'Rockstand',
  'Rocktron',
  'Rockys',
  'Rode',
  'Roger Linn Design',
  'Roger Schult',
  'Rohema',
  'Roko',
  'Roland Digital',
  'Roland',
  'Roli',
  'Rolls',
  'Romana',
  'Ron Vaughn',
  'ROOMs Audio Line',
  'Rosco',
  'Rosendahl',
  'Roth & Junius',
  'Rotosound',
  'Rovner',
  'Royal Oak',
  'Royer Labs',
  'RP Sticks',
  'RTOM',
  'RTW',
  'Rubner',
  'Rudolf Meinl',
  'Rumberger',
  'Runyon',
  'Rupert Neve Designs',
  'Rycote',
  'S-Hoop',
  'S.E. Shires',
  'Sabian',
  'Sabine',
  'Salvi',
  'Samson',
  'Samsung',
  'Sandberg',
  'SanDisk',
  'Sandner',
  'Sankyo',
  'Santo Angelo',
  'Sartory',
  'SAS',
  'Sauter',
  'Savarez',
  'SaxRax',
  'Saxworks',
  'sbip',
  'Scala Vilagio',
  'Scandalli',
  'Schaller',
  'Schalloch',
  'Schatten Design',
  'Schecter',
  'Schell Music',
  'Schertler',
  'Schilke',
  'Schill',
  'Schlagwerk',
  'Schlipf',
  'Schneider',
  'Schoeps',
  'Schott',
  'Schreiber',
  'Schuh Verlag',
  'Schulz',
  'Schwarz',
  'Scotch',
  'SD Systems',
  'SE Electronics',
  'Seeburg',
  'Seiko',
  'Seiler',
  'Seith Musikverlag',
  'Sela',
  'Selecon',
  'SeleS by Selmer',
  'Selmer',
  'Sennheiser',
  'Serato',
  'Sessiondesk',
  'SGM',
  'Shadow',
  'Sherman',
  'Showtec',
  'Shure',
  'Siebenhüner Musikverlag',
  'Sierman',
  'Silverstein',
  'Simrock',
  'Singular Sound',
  'Sirus Pro',
  'SKB',
  'Skullcandy',
  'Slate Digital',
  'Slate Pro Audio',
  'Slide O Mix',
  'Sloane',
  'SM Pro Audio',
  'Smoke Factory',
  'SMS Audio',
  'Snareweight',
  'Snark',
  'Softube',
  'Sol Republic',
  'Solomon',
  'Solton',
  'Sommer Cable',
  'Sonare',
  'Sonaré',
  'Sonarworks',
  'Sonifex',
  'Sonitus Acoustics',
  'Sonnox',
  'Sonor',
  'Sontronics',
  'Sonuus',
  'Sony',
  'Soulo Mute',
  'Sound Devices',
  'Sound Tools',
  'Soundbrenner',
  'Soundcraft',
  'SoundGalaxieS',
  'Soundman',
  'Soundradix',
  'Soundwear',
  'Source Audio',
  'Spectrasonics',
  'SPL',
  'SSB Audio',
  'SSL',
  'Stageclix',
  'Stageworks',
  'Stagg',
  'Stahlhammer',
  'Stairville',
  'Standback',
  'Stanton',
  'Star',
  'Startone',
  "Stefan Grossman's Guitar Works",
  'Steinberg',
  'Steinway & Sons',
  'Stentor',
  'Sterling Modular',
  'Steuer',
  'Stiftung Dacapo',
  'Stokyo',
  'Stölzel',
  'Stork',
  'Strad Pad',
  'Strand Lighting',
  'Strasser',
  'Strauss',
  'Streetlife Music',
  'Stretto',
  'Strube Verlag',
  'Strunal',
  'Strymon',
  'Studio 49',
  'Studio Desk',
  'Studio Electronics',
  'Studio Projects',
  'Studiologic',
  'StudioRTA',
  'Südwest Verlag',
  'Suhr',
  'Sunlite',
  'Super-Sensitive',
  'Superlux',
  'Superslick',
  'Suzuki',
  'Swissonic',
  'Switchcraft',
  'Sylvania',
  'Synthax',
  'Synthogy',
  'Syrincs',
  'T-Rex',
  'TAD',
  'Takt',
  'Tama',
  'Tannoy',
  'TAP',
  'Tascam',
  'Taylor',
  'TC Electronic',
  'TC-Helicon',
  'TDrum',
  'Tech 21',
  'Technics',
  'Techra',
  'Tecxus',
  'Teenage Engineering',
  'Tegeler Audio Manufaktur',
  'Telefunken',
  'Telegärtner',
  'Telex RTS',
  'Telex',
  'Teller',
  'Temple Audio Design',
  'Terrasoniq',
  'Terre',
  'Tesa',
  'TFA',
  'the box pro',
  'the box',
  'the sssnake',
  'the t.akustik',
  'the t.amp',
  'the t.bone',
  'the t.meter',
  'the t.mix',
  'the t.pc',
  'the t.racks',
  'Theo Wanne',
  'Things 4 Strings',
  'Thinwood',
  'Thomann',
  'Thomastik Dominant',
  'Thomastik',
  'Thon',
  'Tido',
  'Tight Screw',
  'Timber Tones',
  'Toca',
  'Toft Audio Designs',
  'ToKo',
  'Tom and Will',
  'Tom Crown',
  'Ton Kooiman',
  'Tone2',
  'Tonelux',
  'Tools 4 Winds',
  'Toontrack',
  'Topstar',
  'Torpedo',
  'Tractel',
  'Traps',
  'Traumzeit Verlag',
  'Triad-Orbit',
  'Trick Drums',
  'Trommus',
  'TRUE Systems',
  'Truetone',
  'TTE Konklang',
  'Tube Amp Doctor',
  'Tube Amp Manufactur',
  'Tube-Tech',
  'Tune Bot',
  'Tunesday Records',
  'Turbosound',
  'Two Notes',
  'TWZ Nicole Joseph',
  'UDG',
  'Ueberschall',
  'UFIP',
  'Ulsa',
  'Ultimate Ears',
  'Ultimate',
  'Ultralite',
  'Ultrasone',
  'Universal Audio',
  'Universal Edition',
  'Urbanears',
  'USA Meyer',
  'Valentino',
  'Valeton',
  'Van Damme Cable',
  'Vandoren',
  'Varta',
  'Varytec',
  'Vater',
  'Vdb',
  'Velcro',
  'Velvet',
  'Verbos Electronics',
  'Verlag der Spielleute',
  'Verlag Hubertus Nogatz',
  'Verlag Johannes Heyn',
  'Vermona Modular',
  'Vermona',
  'Verne Q. Powell',
  'VHT',
  'Vibrass',
  'Vic Firth',
  'Vicoustic',
  'Video Components',
  'Vienna World',
  'Viennabow',
  'Violectric',
  'Violet',
  'Violino',
  'Vir2',
  'Virtuoso',
  'Visaton',
  'Viscount',
  'Visual Productions',
  'Viva la Musica',
  'VMB',
  'Voggenreiter',
  'Voigt Brass',
  'Volonte & Co',
  'Voodoo Lab',
  'Vovox',
  'Vox',
  'VSL',
  'Waldorf',
  'Wallace',
  'Walrus Audio',
  'Waltons Music',
  'Warburton',
  'Warchal',
  'Warm Audio',
  'Warner Bros.',
  'Warnex',
  'Warwick',
  'Waves',
  'WegoForm',
  'Weidler',
  'Weinberger Musikverlag',
  'Weltmeister',
  'WES Audio',
  'Western Digital',
  'Westone',
  'WHD',
  'Whirlwind',
  'Wieland',
  'Wiley Publishing',
  'Wiley-Vch',
  'Wilh. Steinberg',
  'Willis Music',
  'Willson',
  'Wincent',
  'Winner',
  'Wise Publications',
  'Wittner',
  'Wizoo Publishing',
  'Wolf',
  'Woodies',
  'wooDIX',
  'Work',
  'WS',
  'Wurlitzer',
  'Xaphoon',
  'Xilica',
  'XLN Audio',
  'XVive',
  'Yale',
  'Yamaha',
  'Yanagisawa',
  'Yellowtec',
  'Yurbuds',
  'Zaor',
  'Zappatini',
  'Zero 88',
  'Zero-G',
  'ZetClean',
  'Zildjian',
  'Zimmermann Verlag',
  'Zivix',
  'Zoom',
  'Zupan',
  'Zynaptiq'

].freeze
