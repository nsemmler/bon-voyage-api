# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
User.create(
  email: 'test@gmail.com',
  password: 'password'
)

User.create(
  email: 'g@mail.com',
  password: 'something'
)

User.create(
  email: 'all@mail.com',
  password: 'allmail'
)

# Trips
Trip.create(
  user_id: 1,
  destination_name: 'Germany',
  destination_country_code: 'DE',
  destination_region: 'Europe',
  destination_subregion: 'Western Europe',
  destination_languages: ['German'],
  departed: '27/08/2017', # DD/MM/YYYY
  returned: '04/09/2017',
  flew: true,
  drove: false,
  took_train: false,
  booked_hotel: false,
  departure_origin_iata_code: 'NYC',
  departure_destination_iata_code: 'BER',
  return_origin_iata_code: 'BER',
  return_destination_iata_code: 'NYC'
)

Trip.create(
  user_id: 1,
  destination_name: 'United States of America',
  destination_country_code: 'US',
  destination_region: 'Americas',
  destination_subregion: 'North America',
  destination_languages: ['English'],
  departed: '04/07/2018',
  returned: '15/07/2018',
  flew: false,
  drove: true,
  took_train: false,
  booked_hotel: false
)

Trip.create(
  user_id: 3,
  destination_name: 'Greece',
  destination_country_code: 'GR',
  destination_region: 'Europe',
  destination_subregion: 'Southern Europe',
  destination_languages: ['Greek (modern)'],
  departed: '10/04/2018',
  returned: '19/04/2018',
  flew: true,
  drove: false,
  took_train: false,
  booked_hotel: true,
  departure_origin_iata_code: 'RDU',
  departure_destination_iata_code: 'ATH',
  return_origin_iata_code: 'ATH',
  return_destination_iata_code: 'RDU'
)

# Country Codes
CountryCode.create(country_name: "Andorra", country_code: "AD")
CountryCode.create(country_name: "United Arab Emirates", country_code: "AE")
CountryCode.create(country_name: "Afghanistan", country_code: "AF")
CountryCode.create(country_name: "Antigua and Barbuda", country_code: "AG")
CountryCode.create(country_name: "Anguilla", country_code: "AI")
CountryCode.create(country_name: "Albania", country_code: "AL")
CountryCode.create(country_name: "Armenia", country_code: "AM")
CountryCode.create(country_name: "Angola", country_code: "AO")
CountryCode.create(country_name: "Antarctica", country_code: "AQ")
CountryCode.create(country_name: "Argentina", country_code: "AR")
CountryCode.create(country_name: "American Samoa", country_code: "AS")
CountryCode.create(country_name: "Austria", country_code: "AT")
CountryCode.create(country_name: "Australia", country_code: "AU")
CountryCode.create(country_name: "Aruba", country_code: "AW")
CountryCode.create(country_name: "Azerbaijan", country_code: "AZ")
CountryCode.create(country_name: "Bosnia and Herzegovina", country_code: "BA")
CountryCode.create(country_name: "Barbados", country_code: "BB")
CountryCode.create(country_name: "Bangladesh", country_code: "BD")
CountryCode.create(country_name: "Belgium", country_code: "BE")
CountryCode.create(country_name: "Burkina Faso", country_code: "BF")
CountryCode.create(country_name: "Bulgaria", country_code: "BG")
CountryCode.create(country_name: "Bahrain", country_code: "BH")
CountryCode.create(country_name: "Burundi", country_code: "BI")
CountryCode.create(country_name: "Benin", country_code: "BJ")
CountryCode.create(country_name: "Saint-Barthélemy", country_code: "BL")
CountryCode.create(country_name: "Bermuda", country_code: "BM")
CountryCode.create(country_name: "Brunei Darussalam", country_code: "BN")
CountryCode.create(country_name: "Bolivia", country_code: "BO")
CountryCode.create(country_name: "Bonaire", country_code: "BQ")
CountryCode.create(country_name: "Brazil", country_code: "BR")
CountryCode.create(country_name: "Bahamas", country_code: "BS")
CountryCode.create(country_name: "Bhutan", country_code: "BT")
CountryCode.create(country_name: "Botswana", country_code: "BW")
CountryCode.create(country_name: "Belarus", country_code: "BY")
CountryCode.create(country_name: "Belize", country_code: "BZ")
CountryCode.create(country_name: "Democratic Republic of Congo (Kinshasa)", country_code: "CD")
CountryCode.create(country_name: "Central African Republic", country_code: "CF")
CountryCode.create(country_name: "Republic of Congo (Brazzaville)", country_code: "CG")
CountryCode.create(country_name: "Switzerland", country_code: "CH")
CountryCode.create(country_name: "Côte d'Ivoire (Ivory Coast)", country_code: "CI")
CountryCode.create(country_name: "Cook Islands", country_code: "CK")
CountryCode.create(country_name: "Chile", country_code: "CL")
CountryCode.create(country_name: "Cameroon", country_code: "CM")
CountryCode.create(country_name: "China", country_code: "CN")
CountryCode.create(country_name: "Colombia", country_code: "CO")
CountryCode.create(country_name: "Costa Rica", country_code: "CR")
CountryCode.create(country_name: "Cuba", country_code: "CU")
CountryCode.create(country_name: "Cabo Verde", country_code: "CV")
CountryCode.create(country_name: "Curaçao", country_code: "CW")
CountryCode.create(country_name: "Cyprus", country_code: "CY")
CountryCode.create(country_name: "Czech Republic", country_code: "CZ")
CountryCode.create(country_name: "Germany", country_code: "DE")
CountryCode.create(country_name: "Djibouti", country_code: "DJ")
CountryCode.create(country_name: "Denmark", country_code: "DK")
CountryCode.create(country_name: "Dominica", country_code: "DM")
CountryCode.create(country_name: "Dominican Republic", country_code: "DO")
CountryCode.create(country_name: "Algeria", country_code: "DZ")
CountryCode.create(country_name: "Ecuador", country_code: "EC")
CountryCode.create(country_name: "Estonia", country_code: "EE")
CountryCode.create(country_name: "Egypt", country_code: "EG")
CountryCode.create(country_name: "Eritrea", country_code: "ER")
CountryCode.create(country_name: "Spain", country_code: "ES")
CountryCode.create(country_name: "Ethiopia", country_code: "ET")
CountryCode.create(country_name: "Finland", country_code: "FI")
CountryCode.create(country_name: "Fiji", country_code: "FJ")
CountryCode.create(country_name: "Falkland Islands", country_code: "FK")
CountryCode.create(country_name: "Micronesia (FSM)", country_code: "FM")
CountryCode.create(country_name: "France", country_code: "FR")
CountryCode.create(country_name: "Gabon", country_code: "GA")
CountryCode.create(country_name: "United Kingdom", country_code: "GB")
CountryCode.create(country_name: "Grenada", country_code: "GD")
CountryCode.create(country_name: "Georgia", country_code: "GE")
CountryCode.create(country_name: "French Guiana", country_code: "GF")
CountryCode.create(country_name: "Ghana", country_code: "GH")
CountryCode.create(country_name: "Gibraltar", country_code: "GI")
CountryCode.create(country_name: "Greenland", country_code: "GL")
CountryCode.create(country_name: "Gambia, The", country_code: "GM")
CountryCode.create(country_name: "Guinea", country_code: "GN")
CountryCode.create(country_name: "Guadeloupe", country_code: "GP")
CountryCode.create(country_name: "Equatorial Guinea", country_code: "GQ")
CountryCode.create(country_name: "Greece", country_code: "GR")
CountryCode.create(country_name: "Guatemala", country_code: "GT")
CountryCode.create(country_name: "Guam", country_code: "GU")
CountryCode.create(country_name: "Guinea-Bissau", country_code: "GW")
CountryCode.create(country_name: "Guyana", country_code: "GY")
CountryCode.create(country_name: "Hong Kong", country_code: "HK")
CountryCode.create(country_name: "Honduras", country_code: "HN")
CountryCode.create(country_name: "Croatia", country_code: "HR")
CountryCode.create(country_name: "Haiti", country_code: "HT")
CountryCode.create(country_name: "Hungary", country_code: "HU")
CountryCode.create(country_name: "Canary Islands", country_code: "IC")
CountryCode.create(country_name: "Indonesia", country_code: "ID")
CountryCode.create(country_name: "Ireland", country_code: "IE")
CountryCode.create(country_name: "Israel, the West Bank and the Gaza Strip", country_code: "IL")
CountryCode.create(country_name: "India", country_code: "IN")
CountryCode.create(country_name: "Iraq", country_code: "IQ")
CountryCode.create(country_name: "Iran", country_code: "IR")
CountryCode.create(country_name: "Iceland", country_code: "IS")
CountryCode.create(country_name: "Italy", country_code: "IT")
CountryCode.create(country_name: "Jamaica", country_code: "JM")
CountryCode.create(country_name: "Jordan", country_code: "JO")
CountryCode.create(country_name: "Japan", country_code: "JP")
CountryCode.create(country_name: "Kenya", country_code: "KE")
CountryCode.create(country_name: "Kyrgyzstan", country_code: "KG")
CountryCode.create(country_name: "Cambodia", country_code: "KH")
CountryCode.create(country_name: "Kiribati", country_code: "KI")
CountryCode.create(country_name: "Comoros", country_code: "KM")
CountryCode.create(country_name: "Saint Kitts and Nevis", country_code: "KN")
CountryCode.create(country_name: "Korea, North (DPRK)", country_code: "KP")
CountryCode.create(country_name: "Korea, South", country_code: "KR")
CountryCode.create(country_name: "Kuwait", country_code: "KW")
CountryCode.create(country_name: "Cayman Islands", country_code: "KY")
CountryCode.create(country_name: "Kazakhstan", country_code: "KZ")
CountryCode.create(country_name: "Laos", country_code: "LA")
CountryCode.create(country_name: "Lebanon", country_code: "LB")
CountryCode.create(country_name: "Saint Lucia", country_code: "LC")
CountryCode.create(country_name: "Liechtenstein", country_code: "LI")
CountryCode.create(country_name: "Sri Lanka", country_code: "LK")
CountryCode.create(country_name: "Liberia", country_code: "LR")
CountryCode.create(country_name: "Lesotho", country_code: "LS")
CountryCode.create(country_name: "Lithuania", country_code: "LT")
CountryCode.create(country_name: "Luxembourg", country_code: "LU")
CountryCode.create(country_name: "Latvia", country_code: "LV")
CountryCode.create(country_name: "Libya", country_code: "LY")
CountryCode.create(country_name: "Morocco", country_code: "MA")
CountryCode.create(country_name: "Monaco", country_code: "MC")
CountryCode.create(country_name: "Moldova", country_code: "MD")
CountryCode.create(country_name: "Montenegro", country_code: "ME")
CountryCode.create(country_name: "Saint Martin", country_code: "MF")
CountryCode.create(country_name: "Madagascar", country_code: "MG")
CountryCode.create(country_name: "Marshall Islands", country_code: "MH")
CountryCode.create(country_name: "Macedonia", country_code: "MK")
CountryCode.create(country_name: "Mali", country_code: "ML")
CountryCode.create(country_name: "Myanmar", country_code: "MM")
CountryCode.create(country_name: "Mongolia", country_code: "MN")
CountryCode.create(country_name: "Macao", country_code: "MO")
CountryCode.create(country_name: "Northern Marianas", country_code: "MP")
CountryCode.create(country_name: "Martinique", country_code: "MQ")
CountryCode.create(country_name: "Mauritania", country_code: "MR")
CountryCode.create(country_name: "Montserrat", country_code: "MS")
CountryCode.create(country_name: "Malta", country_code: "MT")
CountryCode.create(country_name: "Mauritius", country_code: "MU")
CountryCode.create(country_name: "Maldives", country_code: "MV")
CountryCode.create(country_name: "Malawi", country_code: "MW")
CountryCode.create(country_name: "Mexico", country_code: "MX")
CountryCode.create(country_name: "Malaysia", country_code: "MY")
CountryCode.create(country_name: "Mozambique", country_code: "MZ")
CountryCode.create(country_name: "Namibia", country_code: "NA")
CountryCode.create(country_name: "New Caledonia", country_code: "NC")
CountryCode.create(country_name: "Niger", country_code: "NE")
CountryCode.create(country_name: "Nigeria", country_code: "NG")
CountryCode.create(country_name: "Nicaragua", country_code: "NI")
CountryCode.create(country_name: "Netherlands", country_code: "NL")
CountryCode.create(country_name: "Norway", country_code: "NO")
CountryCode.create(country_name: "Nepal", country_code: "NP")
CountryCode.create(country_name: "Nauru", country_code: "NR")
CountryCode.create(country_name: "Niue", country_code: "NU")
CountryCode.create(country_name: "New Zealand", country_code: "NZ")
CountryCode.create(country_name: "Oman", country_code: "OM")
CountryCode.create(country_name: "Panama", country_code: "PA")
CountryCode.create(country_name: "Peru", country_code: "PE")
CountryCode.create(country_name: "French Polynesia", country_code: "PF")
CountryCode.create(country_name: "Papua New Guinea", country_code: "PG")
CountryCode.create(country_name: "Philippines", country_code: "PH")
CountryCode.create(country_name: "Pakistan", country_code: "PK")
CountryCode.create(country_name: "Poland", country_code: "PL")
CountryCode.create(country_name: "Saint-Pierre-et-Miquelon", country_code: "PM")
CountryCode.create(country_name: "Puerto Rico", country_code: "PR")
CountryCode.create(country_name: "Portugal", country_code: "PT")
CountryCode.create(country_name: "Azores", country_code: "PT-20")
CountryCode.create(country_name: "Palau", country_code: "PW")
CountryCode.create(country_name: "Paraguay", country_code: "PY")
CountryCode.create(country_name: "Qatar", country_code: "QA")
CountryCode.create(country_name: "Réunion", country_code: "RE")
CountryCode.create(country_name: "Romania", country_code: "RO")
CountryCode.create(country_name: "Serbia", country_code: "RS")
CountryCode.create(country_name: "Russia", country_code: "RU")
CountryCode.create(country_name: "Rwanda", country_code: "RW")
CountryCode.create(country_name: "Saudi Arabia", country_code: "SA")
CountryCode.create(country_name: "Solomon Islands", country_code: "SB")
CountryCode.create(country_name: "Seychelles", country_code: "SC")
CountryCode.create(country_name: "Sudan", country_code: "SD")
CountryCode.create(country_name: "Sweden", country_code: "SE")
CountryCode.create(country_name: "Singapore", country_code: "SG")
CountryCode.create(country_name: "Slovenia", country_code: "SI")
CountryCode.create(country_name: "Slovakia", country_code: "SK")
CountryCode.create(country_name: "Sierra Leone", country_code: "SL")
CountryCode.create(country_name: "San Marino", country_code: "SM")
CountryCode.create(country_name: "Senegal", country_code: "SN")
CountryCode.create(country_name: "Somalia", country_code: "SO")
CountryCode.create(country_name: "Suriname", country_code: "SR")
CountryCode.create(country_name: "South Sudan", country_code: "SS")
CountryCode.create(country_name: "São Tomé and Principe", country_code: "ST")
CountryCode.create(country_name: "El Salvador", country_code: "SV")
CountryCode.create(country_name: "Sint Maarten", country_code: "SX")
CountryCode.create(country_name: "Syria", country_code: "SY")
CountryCode.create(country_name: "Swaziland", country_code: "SZ")
CountryCode.create(country_name: "Turks and Caicos Islands", country_code: "TC")
CountryCode.create(country_name: "Chad", country_code: "TD")
CountryCode.create(country_name: "Togo", country_code: "TG")
CountryCode.create(country_name: "Thailand", country_code: "TH")
CountryCode.create(country_name: "Tajikistan", country_code: "TJ")
CountryCode.create(country_name: "Tokelau", country_code: "TK")
CountryCode.create(country_name: "Timor-Leste (East Timor)", country_code: "TL")
CountryCode.create(country_name: "Turkmenistan", country_code: "TM")
CountryCode.create(country_name: "Tunisia", country_code: "TN")
CountryCode.create(country_name: "Tonga", country_code: "TO")
CountryCode.create(country_name: "Turkey", country_code: "TR")
CountryCode.create(country_name: "Trinidad and Tobago", country_code: "TT")
CountryCode.create(country_name: "Tuvalu", country_code: "TV")
CountryCode.create(country_name: "Taiwan", country_code: "TW")
CountryCode.create(country_name: "Tanzania", country_code: "TZ")
CountryCode.create(country_name: "Ukraine", country_code: "UA")
CountryCode.create(country_name: "Uganda", country_code: "UG")
CountryCode.create(country_name: "United States", country_code: "US")
CountryCode.create(country_name: "Uruguay", country_code: "UY")
CountryCode.create(country_name: "Uzbekistan", country_code: "UZ")
CountryCode.create(country_name: "Saint Vincent & the Grenadines", country_code: "VC")
CountryCode.create(country_name: "Venezuela", country_code: "VE")
CountryCode.create(country_name: "British Virgin Islands", country_code: "VG")
CountryCode.create(country_name: "Virgin Islands (U.S.)", country_code: "VI")
CountryCode.create(country_name: "Vietnam", country_code: "VN")
CountryCode.create(country_name: "Vanuatu", country_code: "VU")
CountryCode.create(country_name: "Samoa", country_code: "WS")
CountryCode.create(country_name: "Kosovo", country_code: "XK")
CountryCode.create(country_name: "Yemen", country_code: "YE")
CountryCode.create(country_name: "Mayotte", country_code: "YT")
CountryCode.create(country_name: "South Africa", country_code: "ZA")
CountryCode.create(country_name: "Zambia", country_code: "ZM")
CountryCode.create(country_name: "Zimbabwe", country_code: "ZW")
