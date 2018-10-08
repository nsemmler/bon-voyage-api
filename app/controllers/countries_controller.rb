class CountriesController < ApplicationController
  before_action :authenticate_user!

  # returns all Countries that meet the provided criteria
  def suggestVacationDestinations
    # EH
    if !params[:regions] && !params[:subregions] && !params[:population] && !params[:island] && !params[:english_only]
      render json: { error: 'At least one filter required.' }, status: 400
    else
      @countries = Country.order(region: :asc, name: :asc)

      # Regions/Subregions
      @countries = @countries.where(region: params[:regions]) if params[:regions]
      @countries = @countries.where(subregion: params[:subregions]) if params[:subregions]

      # Population
      if params[:population]
        population_lower_bound = setCountryPopulationLowerBound(params[:population])
        population_upper_bound = setCountryPopulationUpperBound(params[:population])
      end

      @countries = @countries.where("population >= ?", population_lower_bound).where("population <= ?", population_upper_bound) if params[:population]

      # Island nations only?
      if params[:island] && params[:island] === "Yes"
        @countries = @countries.where(bordered_by: nil)
      elsif params[:island] && params[:island] === "No"
        @countries = @countries.where("bordered_by like ?", "%[%")
      elsif params[:island] && params[:island] === "Show both"
        # do nothing
      end

      # Predominately English speaking nations only?
      if params[:english_only] && params[:english_only] === "Yes"
        @countries = @countries.where("languages like ?", "%English%")
      elsif params[:english_only] && params[:english_only] === "No"
        @countries = @countries.where.not("languages like ?", "%English%")
      elsif params[:english_only] && params[:english_only] === "Show both"
        # do nothing
      end

      puts "NUMBER OF COUNTRIES RETURNED: #{@countries.as_json.length}"

      country_pois_arr = []
      @countries.each do |country|
        country_pois_arr.push(country.point_of_interests)
      end

      render json: { countries: @countries, pois: country_pois_arr }
    end
  end

  private

  def setCountryPopulationLowerBound (params)
    populations_arr = params
    population_lower_bound = 0

    if populations_arr.include?("Small (< 1,000,000)")
      population_lower_bound = 0
    elsif populations_arr.include?("Medium (1,000,000 - 10,000,000)")
      population_lower_bound = 1000000
    elsif populations_arr.include?("Large (> 10,000,000)")
      population_lower_bound = 10000000
    end

    return population_lower_bound
  end

  def setCountryPopulationUpperBound (params)
    populations_arr = params
    population_upper_bound = 10000000000

    if populations_arr.include?("Large (> 10,000,000)")
      population_upper_bound = 10000000000
    elsif populations_arr.include?("Medium (1,000,000 - 10,000,000)")
      population_upper_bound = 10000000
    elsif populations_arr.include?("Small (< 1,000,000)")
      population_upper_bound = 1000000
    end

    return population_upper_bound
  end
end
