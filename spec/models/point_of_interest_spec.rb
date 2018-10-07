require 'rails_helper'

RSpec.describe PointOfInterest, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(PointOfInterest.new(
        country_id: 100,
        name: "New POI",
        description: "POI Description",
        score: 8.00000,
        longitude: -10.0,
        latitude: 10.0
      )).to be_valid
    end

    it "is not valid without a country_id" do
      expect(PointOfInterest.new(
        country_id: nil,
        name: "New POI",
        description: "POI Description",
        score: 8.00000,
        longitude: -10.0,
        latitude: 10.0
      )).to_not be_valid
    end

    it "is not valid without a name" do
      expect(PointOfInterest.new(
        country_id: 100,
        name: nil,
        description: "POI Description",
        score: 8.00000,
        longitude: -10.0,
        latitude: 10.0
      )).to_not be_valid
    end

    it "is not valid without a description" do
      expect(PointOfInterest.new(
        country_id: 100,
        name: "New POI",
        description: nil,
        score: 8.00000,
        longitude: -10.0,
        latitude: 10.0
      )).to_not be_valid
    end

    it "is not valid without a score" do
      expect(PointOfInterest.new(
        country_id: 100,
        name: "New POI",
        description: "POI Description",
        score: nil,
        longitude: -10.0,
        latitude: 10.0
      )).to_not be_valid
    end

    it "is not valid without a longitude" do
      expect(PointOfInterest.new(
        country_id: 100,
        name: "New POI",
        description: "POI Description",
        score: 8.00000,
        longitude: nil,
        latitude: 10.0
      )).to_not be_valid
    end

    it "is not valid without a latitude" do
      expect(PointOfInterest.new(
        country_id: 100,
        name: "New POI",
        description: "POI Description",
        score: 8.00000,
        longitude: -10.0,
        latitude: nil
      )).to_not be_valid
    end
  end
end
