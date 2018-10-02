class Country < ApplicationRecord
  has_many :point_of_interests, dependent: :destroy
end
