class UsersFavorite < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :countries, dependent: :destroy
end
