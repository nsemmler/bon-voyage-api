class PointOfInterest < ApplicationRecord
  belongs_to :country, optional: true

  validates_presence_of :country_id,
    :name,
    :description,
    :score,
    :longitude,
    :latitude
end
