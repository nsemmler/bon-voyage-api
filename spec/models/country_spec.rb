require 'rails_helper'

RSpec.describe Country, type: :model do
  subject { described_class.new(
    name: "Natland",
    capital: "Nate"
  )}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a capital" do
      subject.capital = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:point_of_interests) }
    it { should have_many(:users_favorites) }
    it { should have_many(:users).through(:users_favorites) }
  end
end
