require 'rails_helper'
require 'pry'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  let(:email) { users.first.email }
  let(:password) { users.first.password }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the User exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the User does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end

  # POST /users
  describe 'POST /users' do
    let(:valid_attributes) { { email: 'ab@gmail.com', password: 'testypass' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { email: 'test@me.com' } }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end

  # POST /users/login
  describe 'POST /users/login' do
    let(:valid_attributes) { { email: email, password: password } }

    context 'when the User exists' do
      before { post "/users/login", params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
