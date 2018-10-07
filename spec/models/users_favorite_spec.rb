require 'rails_helper'

RSpec.describe UsersFavorite, type: :model do
  subject { described_class.new(
    user_id: 1,
    country_id: 240
  )}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a country_id" do
      subject.country_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:country) }
  end
end
