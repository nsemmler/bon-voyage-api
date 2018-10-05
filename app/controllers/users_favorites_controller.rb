class UsersFavoritesController < ApplicationController
  before_action :authenticate_user!
  
  # Fetch all User Favorites
  def fetchUsersFavorites
    if params[:user_id]
      favorites = UsersFavorite.where(user_id: params[:user_id].to_i)
      render json: favorites
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
