class CountryCode < ApplicationRecord
  validates_presence_of :country_name
end
