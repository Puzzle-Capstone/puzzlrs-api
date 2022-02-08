require 'rails_helper'

describe 'Requests API' do
  let!(:user1) do
    User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address)
  end
  let!(:user2) do
    User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address)
  end

  let!(:puzzle1) do
    user1.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre,
                         piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Good', original_price_point: '35.99')
  end
  let!(:puzzle2) do
    user2.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre,
                         piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Poor', original_price_point: '35.99')
  end
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  describe 'POST /api/v1/requests' do
    it 'creates a new request and returns it' do
      request_params = {
        user_id: user1.id,
        puzzle_id: puzzle2.id
      }

      post '/api/v1/requests', params: request_params.to_json, headers: headers

      expect(response).to be_successful

      request = JSON.parse(response.body, symbolize_names: true)

      expect(request).not_to be_empty
      expect(request).to be_a Hash
      expect(request[:data][:type]).to eq('request')
      expect(request[:data][:attributes].length).to eq(3)
      expect(request[:data][:attributes]).to include(:user_id, :puzzle_id)
    end

    it 'doesn\'t create a new request with missing parameters' do
      request_params = {
        user_id: user1.id
      }

      post '/api/v1/requests', params: request_params.to_json, headers: headers

      expect(response).to have_http_status(400)
    end
  end

  describe 'PATCH /api/v1/requests/:id' do
    it 'sets status to accepted' do
      request = Request.create(user_id: user1.id, puzzle_id: puzzle2.id)

      request_params = {
        status: 'accepted'
      }

      patch "/api/v1/requests/#{request.id}", params: request_params.to_json, headers: headers

      expect(response).to be_successful

      request = JSON.parse(response.body, symbolize_names: true)

      expect(request[:data][:attributes].length).to eq(3)
      expect(request[:data][:attributes]).to include(:user_id, :puzzle_id, :status)
      expect(request[:data][:attributes][:status]).to eq('accepted')
    end

    it 'sets status to declined' do
      request = Request.create(user_id: user1.id, puzzle_id: puzzle2.id)

      request_params = {
        status: 'declined'
      }

      patch "/api/v1/requests/#{request.id}", params: request_params.to_json, headers: headers

      expect(response).to be_successful

      request = JSON.parse(response.body, symbolize_names: true)

      expect(request[:data][:attributes].length).to eq(3)
      expect(request[:data][:attributes]).to include(:user_id, :puzzle_id, :status)
      expect(request[:data][:attributes][:status]).to eq('declined')
    end
  end

  describe 'DELETE /api/vi/requests/:id' do
    it 'deletes the given request' do
      request = Request.create(user_id: user1.id, puzzle_id: puzzle2.id)

      delete "/api/v1/requests/#{request.id}", headers: headers

      expect(response).to be_successful

      expect(Request.all).to eq([])
    end
  end
end
