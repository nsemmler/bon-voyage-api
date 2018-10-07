class UsersFavorite < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :countries, optional: true

  validates_presence_of :user_id, :country_id
end
