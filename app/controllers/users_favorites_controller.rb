class UsersFavoritesController < ApplicationController
  before_action :authenticate_user!

  # Fetch all User Favorites
  def fetchUsersFavorites
    if params[:user_id] # requires query string ?user_id=x
      favorites = UsersFavorite.where(user_id: params[:user_id].to_i).select(:id, :user_id, :country_id)

      favorites_copy = favorites
      favorites_arr = []

      favorites_copy.each do |favorite|
        favorites_arr.push(Country.find(favorite.country_id))
      end

      country_pois_arr = []
      favorites_arr.each do |country|
        country_pois_arr.push(country.point_of_interests)
      end

      render json: { countries: favorites_arr, pois: country_pois_arr }
    else
      render json: { error: 'Invalid User ID' }, status: 400
    end
  end

  # Favorite a Country
  def create
    if params[:user_id] && params[:country_id]
      favorite = UsersFavorite.create(user_id: params[:user_id].to_i, country_id: params[:country_id].to_i)
      render json: favorite
    else
      render json: { error: 'Invalid User or Country ID' }, status: 400
    end
  end

  # Un-favorite Country
  def destroy
    if params[:user_id] && params[:country_id]
      UsersFavorite.find_by(user_id: params[:user_id].to_i, country_id: params[:country_id].to_i).destroy
      render json: { success: "Country unfavorited" }, status: 204
    else
      render json: { error: 'Invalid User or Country ID' }, status: 400
    end
  end
end
