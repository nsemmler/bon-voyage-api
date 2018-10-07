require 'rails_helper'

RSpec.describe Country, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(Country.new(name: "Natland", capital: "Nate", country_code: "NN")).to be_valid
    end

    it "is not valid without a name" do
      expect(Country.new(name: nil, capital: "Nate", country_code: "NN")).to_not be_valid
    end

    it "is not valid without a capital" do
      expect(Country.new(name: "Natland", capital: nil, country_code: "NN")).to_not be_valid
    end

    it "is not valid without a country_code" do
      expect(Country.new(name: "Natland", capital: "Nate", country_code: nil)).to_not be_valid
    end
  end
end
