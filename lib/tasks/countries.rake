require 'rest-client'
require 'net/https'
require 'uri'
require 'json'

namespace :countries do
  desc 'Creates Country object for every nation in the World'
  task run_all: [
    :fetch_country_general_info,
    :seed_db_with_country_info,
    :update_bordered_by_values,
    :fetch_country_images,
    :fetch_points_of_interest
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
            flag: country["flag"],
            images: nil
          )
        end
      end
    end

    puts "seed_db_with_country_info completed"
  end

  desc "Updates bordered_by attribute to replace border country codes with country names"
  task update_bordered_by_values: :environment do
    puts "Starting update_bordered_by_values"

    if File.exist?('public/countries.json')
      file = JSON.parse(File.read("public/countries.json"))
      countries_arr = JSON.parse(file)

      countries_arr.each do |country|
        if (!Country.find_by(name: country["name"]).nil?)
          if (Country.find_by(name: country["name"]).images.nil?)
            border_countries = country["borders"]
            if (border_countries)
              border_countries = border_countries.map! { |cc| Country.find_by(alpha_code: cc).name }
              border_countries = nil if (border_countries === [])
              Country.find_by(name: country["name"]).update(bordered_by: border_countries)
            end
          end
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
        if (!Country.find_by(name: country["name"]).nil?)
          if (Country.find_by(name: country["name"]).images.nil?)
            puts "Fetching pictures for #{country["name"]}"

            response = RestClient.get("https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=#{country['name'].gsub(/\u00C5/, 'A').gsub(/\u00E7/, 'c').gsub(/\u00F4/, 'o').gsub(/\u00E9/, 'e')}%20tourist%20attractions", headers={
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
    end

    puts "fetch_country_images completed"
  end

  desc "Fetches POIs for every country"
  task fetch_points_of_interest: :environment do
    puts "Starting fetch_points_of_interest"

    file = JSON.parse(File.read("public/countries.json"))
    countries_arr = JSON.parse(file)

    countries_arr.each do |country|
      if (!Country.find_by(name: country["name"]).nil?)
        url = "https://www.triposo.com/api/20180627/poi.json?account=#{ENV['TRIPOSO_ACCT']}&token=#{ENV['TRIPOSO_TOKEN']}&countrycode=#{country['alpha2Code']}&tag_labels=do|nightlife|cuisine|sightseeing|landmarks&order_by=-score&count=10"

        begin
          response = RestClient::Request.execute(method: :get, url: url, timeout: 30, open_timeout: 30)
          parsed_resp = JSON.parse(response)

          images_arr = []
          country = Country.find_by(country_code: country['alpha2Code'])

          parsed_resp["results"].each_with_index do |poi, i|
            if i < 10
              wiki_link_arr = poi["attribution"].keep_if { |obj| obj["source_id"] === "wikipedia" }
              link = (wiki_link_arr.length > 0) ? wiki_link_arr[0]["url"] : nil

              if poi["images"].length > 0
                poi["images"].each_with_index do |image, img_index|
                  images_arr.push(image["sizes"]["original"]["url"]) if img_index < 5
                end
              end

              PointOfInterest.create(
                country_id: country.id,
                name: poi["name"],
                description: poi["snippet"],
                score: poi["score"],
                wikipedia_link: link,
                image: images_arr,
                longitude: poi["coordinates"]["longitude"],
                latitude: poi["coordinates"]["latitude"]
              )
            end
          end

          puts "Generated POIs for: #{country.name}"
          sleep 1
        rescue
          puts "**************************************************"
          puts "Country Code that failed: #{country['alpha2Code']}"
          puts "**************************************************"
        end
      end
    end

    puts "fetch_points_of_interest completed"
  end
end
