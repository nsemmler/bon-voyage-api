class CountriesController < ApplicationController
  # returns the Country Code for a given Country
  # def getCCforCountryName
  #   if params[:country_name]
  #     cc = CountryCode.find_by(country_name: params[:country_name])
  #     render json: { country_code: cc['country_code'] }
  #   else
  #     render json: { error: 'Invalid Country name' }, status: 400
  #   end
  # end
end
