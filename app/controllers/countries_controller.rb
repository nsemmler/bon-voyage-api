class CountriesController < ApplicationController
  # returns all Countries located in a given subregion
  def fetchCountryBySubregion
    if params[:subregions]
      countries = Country.select(:id, :name, :native_name, :capital, :country_code, :region, :subregion, :population, :latitude, :longitude, :bordered_by, :currency_name, :currency_symbol, :languages, :flag, :polygon_coordinatess, :advisory_state, :advisory_description, :has_advisory_warning, :has_regional_advisory)
        .where(subregion: JSON.parse(params[:subregions]))
        .order(subregion: :asc, name: :asc)

      render json: countries, status: 200
    else
      render json: { error: 'Subregion param required.' }, status: 400
    end
  end
end
