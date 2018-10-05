class Country < ApplicationRecord
  has_many :point_of_interests, dependent: :destroy
  has_many :users_favorites, dependent: :destroy
  has_many :users, through: :users_favorites
end
