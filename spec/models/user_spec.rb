require 'rails_helper'

RSpec.describe User, type: :model do
  # before(:all) do
  #   Rails.application.load_seed
  # end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(User.new(email: "some@mail.com", password: "something")).to be_valid
    end

    it "is not valid without an email" do
      expect(User.new(email: nil, password: "something")).to_not be_valid
    end

    it "is not valid without an email of at least 5 characters" do
      expect(User.new(email: "s@mm", password: "something")).to_not be_valid
    end

    it "is not valid without a password" do
      expect(User.new(email: "some@mail.com", password: nil)).to_not be_valid
    end

    it "is not valid without a password of at least 6 characters" do
      expect(User.new(email: "some@mail.com", password: "short")).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:users_favorites) }
    it { should have_many(:countries).through(:users_favorites) }
  end

  # describe 'User model' do
  #   it { should validate_presence_of(:email) }
  #   it { should validate_presence_of(:password) }
  #
  #   it "is valid with valid attributes" do
  #     expect(User.new).to be_valid
  #   end
  # end
end
