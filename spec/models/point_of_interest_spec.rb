require 'rails_helper'

RSpec.describe PointOfInterest, type: :model do
  subject { described_class.new(
    country_id: 100,
    name: "New POI",
    description: "POI Description",
    score: 8.00000,
    longitude: -10.0,
    latitude: 10.0
  )}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a country_id" do
      subject.country_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a score" do
      subject.score = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a longitude" do
      subject.longitude = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a latitude" do
      subject.latitude = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:country) }
  end
end
