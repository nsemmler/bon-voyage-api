class PointOfInterestsController < ApplicationController
  before_action :authenticate_user!
  
  def fetchCountryPointsOfInterest
    if params[:country_id]
      points_of_interest = PointOfInterest.where(country_id: params[:country_id].to_i).select(:id, :country_id, :name, :description, :score, :wikipedia_link, :longitude, :latitude, :image).order(score: :desc)
      render json: points_of_interest
    else
      render json: { error: 'Invalid Country ID' }, status: 400
    end
  end
end
