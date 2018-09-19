class TripsController < ApplicationController
  # Get all Trips given User ID
  def show
    if params[:user_id]
      trips = Trip.where(user_id: params[:user_id].to_i)
      render json: trips
    else
      render json: { error: 'Invalid User ID' }, status: 400
    end
  end

  # Create new Trip
  def create
    trip = Trip.new(trip_params)
    if trip.save
      render json: trip
    else
      render json: { errors: trip.errors.full_messages }, status: 400
    end
  end

  # Update a Trip
  def update
    if params[:id] && params[:user_id]
      trip = Trip.find(params[:id].to_i)
      if trip
        trip.update(trip_params)
        if trip.save
          render json: trip, status: 202
        end
      end
    else
      render json: { error: 'Invalid Trip ID' }, status: 400
    end
  end

  # Delete Trip
  def destroy
    if params[:id] && params[:user_id]
      trip = Trip.find(params[:id].to_i).destroy
      render json: { success: "Trip destroyed" }, status: 204
    else
      render json: { error: 'Invalid Trip ID' }, status: 400
    end
  end

  private

  def trip_params
    params.permit(:user_id,
      :destination_name,
      :destination_country_code,
      :destination_region,
      :destination_subregion,
      :destination_languages,
      :departed,
      :returned,
      :flew,
      :drove,
      :took_train,
      :booked_hotel,
      :departure_origin_iata_code,
      :departure_destination_iata_code,
      :return_origin_iata_code,
      :return_destination_iata_code
    )
  end
end
