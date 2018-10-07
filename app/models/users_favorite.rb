class UsersFavorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :country, optional: true

  validates_presence_of :user_id, :country_id
end
