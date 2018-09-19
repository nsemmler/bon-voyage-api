class Trip < ApplicationRecord
  belongs_to :user

  serialize :destination_languages
  validates_presence_of :user_id
  validates :flew, :drove, :took_train, :booked_hotel, inclusion: { in: [ true, false ] }
end
