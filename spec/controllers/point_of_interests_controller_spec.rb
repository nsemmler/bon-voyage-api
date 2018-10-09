require 'rails_helper'

RSpec.describe PointOfInterestsController, type: :controller do
  describe "GET fetchCountryPointsOfInterest" do
    before { get :fetchCountryPointsOfInterest }

    it "returns unathorized status" do
      expect(response.status).to eq 401
    end
  end

  # describe "responds to" do
  #   it "responds to html by default" do
  #     get :fetchCountryPointsOfInterest, { :widget => { country_id: 1 } }
  #     expect(response.content_type).to eq "text/html"
  #   end
  #
  #   it "responds to custom formats when provided in the params" do
  #     get :fetchCountryPointsOfInterest, { :widget => { country_id: 1 }, :format => :json }
  #     expect(response.content_type).to eq "application/json"
  #   end
  # end
end
