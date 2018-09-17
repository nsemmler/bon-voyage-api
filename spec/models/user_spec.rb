require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'User model' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
