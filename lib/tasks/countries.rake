require 'rest-client'
require 'net/https'
require 'uri'
require 'json'
require 'pry'

namespace :countries do
  desc 'Creates Country object for every nation in the World'
  task run_all: [
    :fetch_country_general_info,
    :seed_db_with_country_info,
    # :fetch_country_advisory_info,
    :update_bordered_by_values,
    :fetch_country_images
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
        country_in_db = Country.find_by(name: country["name"])

        if country_in_db.nil?
          languages = country["languages"].map! { |lang_obj| lang_obj["name"] }
          languages = nil if languages.empty?
          country["borders"] === [] ? bordered_by = nil : bordered_by = country["borders"]
          country["name"] === "Viet Nam" ? name = "Vietnam" : name = country["name"]

          if (country["subregion"] === '')
            region = "Polar"
            subregion = "Polar"
          else
            region = country["region"]
            subregion = country["subregion"]
          end

          Country.create(
            name: country["name"],
            native_name: country["nativeName"],
            capital: country["capital"],
            country_code: country["alpha2Code"],
            alpha_code: country["alpha3Code"],
            region: region,
            subregion: subregion,
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

  # desc "Updates Countries' safety advisory information"
  # task fetch_country_advisory_info: :environment do
  #   puts "Starting fetch_country_advisory_info"
  #
  #   large_countries = Country.where("population > ?", 10000000).order('population ASC')
  #
  #   large_countries.each do |country|
  #     cc = country.country_code
  #
  #     if Country.find(country.id).advisory_state.nil?
  #       response = RestClient.get("https://api.tugo.com/v1/travelsafe/countries/#{cc}", headers={
  #           "X-Auth-API-Key": ENV["TUGO_TOKEN"],
  #           "Content-Type": "application/x-www-form-urlencoded"
  #         })
  #       parsed_resp = JSON.parse(response)
  #       Country.update(country.id,
  #         advisory_state: parsed_resp["advisoryState"],
  #         advisory_description: parsed_resp["advisoryText"],
  #         has_advisory_warning: parsed_resp["hasAdvisoryWarning"],
  #         has_regional_advisory: parsed_resp["hasRegionalAdvisory"]
  #       )
  #     end
  #   end
  #
  #   puts "fetch_country_advisory_info completed"
  # end

  desc "Updates bordered_by attribute to replace border country codes with country names"
  task update_bordered_by_values: :environment do
    puts "Starting update_bordered_by_values"

    if File.exist?('public/countries.json')
      file = JSON.parse(File.read("public/countries.json"))
      countries_arr = JSON.parse(file)

      countries_arr.each do |country|
        border_countries = country["borders"]
        if (border_countries)
          border_countries = border_countries.map! { |cc| Country.find_by(alpha_code: cc).name }
          border_countries = nil if (border_countries === [])
          Country.find_by(name: country["name"]).update(bordered_by: border_countries)
        end
      end
    end

    puts "update_bordered_by_values completed"
  end

  desc "Fetches images for every country, writes to JSON file"
  task fetch_country_images: :environment do
    puts "Starting fetch_country_images"

    if File.exist?('public/countries.json')
      file = JSON.parse(File.read("public/countries.json"))
      countries_arr = JSON.parse(file)

      countries_arr.each do |country|
        if (Country.find_by(name: country["name"]).images.nil?)
          puts "Fetching pictures for #{country["name"]}"

          response = RestClient.get("https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=#{country['name'].gsub(/\u00C5/, 'A').gsub(/\u00E7/, 'c').gsub(/\u00F4/, 'o').gsub(/\u00E9/, 'e')}", headers={
            "Ocp-Apim-Subscription-Key": ENV["BING_KEY_1"]
          })

          images_arr = JSON.parse(response)["value"]
          country_images_arr = []

          images_arr.each_with_index do |image_obj, i|
            country_images_arr.push(image_obj["contentUrl"]) if (i < 15)
          end

          Country.find_by(name: country["name"]).update(images: country_images_arr)
          sleep 1
        end
      end
    end

    puts "fetch_country_images completed"
  end
end
