require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    email: "some@mail.com",
    password: "something"
  )}

  # before(:all) do
  #   Rails.application.load_seed
  # end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email of at least 5 characters" do
      subject.email = "m@mm"
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password of at least 6 characters" do
      subject.password = "fail"
      expect(subject).to_not be_valid
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
