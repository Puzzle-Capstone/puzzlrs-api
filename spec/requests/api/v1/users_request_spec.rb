require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'GET /api/vi/users/:id' do
    let!(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }

    before { get "/api/v1/users/#{user.id}" }

    it 'returns the user' do
      expect(response).to be_successful

      user_data = JSON.parse(response.body, symbolize_names: :true)[:data]

      expect(user_data).to have_key(:id)
      expect(user_data[:id]).to be_an(String)
      expect(user_data[:id]).to eq user.id.to_s

      expect(user_data[:type]).to eq("users")

      expect(user_data[:attributes].count).to eq(4)
      expect(user_data[:attributes][:username]).to eq(user.username)
      expect(user_data[:attributes][:puzzles]).to eq([])
      expect(user_data[:attributes][:sent_requests]).to eq([])
      expect(user_data[:attributes][:received_requests]).to eq([])
    end
  end
end
