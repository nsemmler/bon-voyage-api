class CountriesController < ApplicationController
  # returns all Countries that meet the provided criteria
  def suggestVacationDestinations
    # EH
    if !params[:regions] && !params[:subregions] && !params[:population] && !params[:island] && !params[:english_only]
      render json: { error: 'At least one filter required.' }, status: 400
    else
      @countries = Country.order(region: :asc, name: :asc)

      # Regions/Subregions
      @countries = @countries.where(region: JSON.parse(params[:regions])) if params[:regions]
      @countries = @countries.where(subregion: JSON.parse(params[:subregions])) if params[:subregions]

      # Population
      if params[:population]
        population_lower_bound = setCountryPopulationLowerBound(params[:population])
        population_upper_bound = setCountryPopulationUpperBound(params[:population])
      end

      @countries = @countries.where("population > ?", population_lower_bound).where("population < ?", population_upper_bound) if params[:population]

      # Island nations only?
      if params.include?("island")
        if params[:island] === "false"
          @countries = @countries.where("bordered_by like ?", "%[%")
        elsif params[:island] === "true"
          @countries = @countries.where(bordered_by: nil)
        end
      end

      # Language
      @countries = @countries.where("languages like ?", "%English%") if params.include?("english_only") && params[:english_only]

      puts "NUMBER OF COUNTRIES RETURNED: #{@countries.as_json.length}"

      render json: @countries.as_json
    end
  end

  private

  def setCountryPopulationLowerBound (params)
    populations_arr = JSON.parse(params)
    population_lower_bound = 0

    if populations_arr.include?("S")
      population_lower_bound = 0
    elsif populations_arr.include?("M")
      population_lower_bound = 1000000
    elsif populations_arr.include?("L")
      population_lower_bound = 10000000
    end

    return population_lower_bound
  end

  def setCountryPopulationUpperBound (params)
    populations_arr = JSON.parse(params)
    population_upper_bound = 10000000000

    if populations_arr.include?("L")
      population_upper_bound = 10000000000
    elsif populations_arr.include?("M")
      population_upper_bound = 10000000
    elsif populations_arr.include?("S")
      population_upper_bound = 1000000
    end

    return population_upper_bound
  end
end
