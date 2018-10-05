class UsersFavorite < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :countries, optional: true
end
