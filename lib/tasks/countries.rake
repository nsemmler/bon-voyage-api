require 'rest-client'
require 'json'
require 'pry'

namespace :countries do
  desc 'Executes all other rake tasks'
  task run_all: [
    :fetch_country_general_info,
    :seed_db_with_country_info,
    :fetch_country_advisory_info,
    :fetch_country_polygon_coordinates
  ]

  desc "Fetches general information for every country, writes to JSON file"
  task fetch_country_general_info: :environment do
    puts "Starting fetch_country_general_info"

    if !File.exist?('public/countries.json')
      response = RestClient.get('https://restcountries.eu/rest/v2/all')

      File.open('public/countries.json', "w+") do |f|
        f.write(response.to_json)
      end
    else
      puts "Countries JSON file already generated"
    end

    puts "fetch_country_general_info completed"
  end

  desc "Seed database with JSON file"
  task seed_db_with_country_info: :environment do
    puts "Starting seed_db_with_country_info"

    raise "Do not run in production!" if Rails.env.production?

    if File.exist?('public/countries.json')
      file = JSON.parse(File.read("public/countries.json"))
      countries_arr = JSON.parse(file)

      countries_arr.each do |country|
        country = Country.find_by(name: country["name"])

        if country.nil?
          languages = country["languages"].map! {|lang_obj| lang_obj["name"]}
          languages = nil if languages.empty?
          country["borders"] === [] ? bordered_by = nil : bordered_by = country["borders"]

          Country.create(
            name: country["name"],
            native_name: country["nativeName"],
            capital: country["capital"],
            country_code: country["alpha2Code"],
            alpha_code: country["alpha3Code"],
            region: country["region"],
            subregion: country["subregion"],
            population: country["population"],
            latitude: country["latlng"][0],
            longitude: country["latlng"][1],
            bordered_by: bordered_by,
            currency_name: country["currencies"][0]["name"],
            currency_symbol: country["currencies"][0]["symbol"],
            languages: languages,
            flag: country["flag"]
          )
        end
      end
    end

    puts "seed_db_with_country_info completed"
  end

  desc "Updates Countries' safety advisory information"
  task fetch_country_advisory_info: :environment do
    puts "Starting fetch_country_advisory_info"

    large_countries = Country.where("population > ?", 10000000).order('population ASC')

    large_countries.each do |country|
      cc = country.country_code

      if Country.find(country.id).advisory_state.nil?
        response = RestClient.get("https://api.tugo.com/v1/travelsafe/countries/#{cc}", headers={
            "X-Auth-API-Key": ENV["TUGO_TOKEN"],
            "Content-Type": "application/x-www-form-urlencoded"
          })
        parsed_resp = JSON.parse(response)
        Country.update(country.id,
          advisory_state: parsed_resp["advisoryState"],
          advisory_description: parsed_resp["advisoryText"],
          has_advisory_warning: parsed_resp["hasAdvisoryWarning"],
          has_regional_advisory: parsed_resp["hasRegionalAdvisory"]
        )
      end
    end

    puts "fetch_country_advisory_info completed"
  end

  desc "Fetches each Countries' Google Maps polygon coordinates"
  task fetch_country_polygon_coordinates: :environment do
    puts "Starting fetch_country_polygon_coordinates"

    large_countries = Country.where("population > ?", 10000000).order('population ASC')

    large_countries.each do |country|
      cc = country.country_code

      if Country.find(country.id).polygon_coordinatess.nil?
        response = RestClient.get("https://www.oipa.nl/api/countries/#{cc}?format=json")
        coordinates = JSON.parse(response)["polygon"]["coordinates"]
        Country.update(country.id, polygon_coordinatess: coordinates[0])
      end
    end

    puts "fetch_country_polygon_coordinates completed"
  end
end
