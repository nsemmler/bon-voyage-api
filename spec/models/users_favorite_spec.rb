require 'rails_helper'

RSpec.describe UsersFavorite, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(UsersFavorite.new(user_id: 1, country_id: 240)).to be_valid
    end

    it "is not valid without a user_id" do
      expect(UsersFavorite.new(user_id: nil, country_id: 100)).to_not be_valid
    end

    it "is not valid without a country_id" do
      expect(UsersFavorite.new(user_id: 1, country_id: nil)).to_not be_valid
    end
  end
end
