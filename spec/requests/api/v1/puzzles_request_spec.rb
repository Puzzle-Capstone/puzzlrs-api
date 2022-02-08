require 'rails_helper'

RSpec.describe 'Puzzles API' do
  describe 'GET /api/vi/puzzles' do
    let!(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }

    let!(:puzzle1) { user.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Good', original_price_point: '35.99') }
    let!(:puzzle2) { user.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Poor', original_price_point: '35.99') }
    let!(:puzzle3) { user.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Great', original_price_point: '35.99') }

    before { get '/api/v1/puzzles' }

    it 'returns a list of all the puzzles' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      puzzle_list = JSON.parse(response.body, symbolize_names: :true)[:data]

      expect(puzzle_list).not_to be_empty
      expect(puzzle_list.count).to eq(3)

      puzzle_list.each do |puzzle|
        expect(puzzle[:attributes]).to have_key(:user_id)
        expect(puzzle[:attributes][:user_id]).to be_an(Integer)

        expect(puzzle[:attributes]).to have_key(:image)
        expect(puzzle[:attributes][:image]).to be_a(String)

        expect(puzzle[:attributes]).to have_key(:category)
        expect(puzzle[:attributes][:category]).to be_a(String)

        expect(puzzle[:attributes]).to have_key(:piece_count)
        expect(puzzle[:attributes][:piece_count]).to be_a(String)

        expect(puzzle[:attributes]).to have_key(:missing_pieces)
        expect(puzzle[:attributes][:missing_pieces]).to be_a(String)

        expect(puzzle[:attributes]).to have_key(:availability)
        expect(puzzle[:attributes][:availability]).to be true

        expect(puzzle[:attributes]).to have_key(:quality)
        expect(puzzle[:attributes][:quality]).to be_a(String)

        expect(puzzle[:attributes]).to have_key(:original_price_point)
        expect(puzzle[:attributes][:original_price_point]).to be_a(String)
      end
    end
  end

  describe 'GET /api/v1/puzzles/:id' do
    let!(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }


    let!(:puzzle) { user.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-little-friends-new-york_5274230_4_1800x1800.jpg?v=1638227460', category: 'Mystery', piece_count: 5000, missing_pieces: 0, availability: true, quality: 'Good', original_price_point: '35.99') }

    before { get "/api/v1/puzzles/#{puzzle.id}" }
    
    it 'should return the puzzle' do
      expect(response).to be_successful

      puzzle_data = JSON.parse(response.body, symbolize_names: :true)[:data]

      expect(puzzle_data).to have_key(:id)
      expect(puzzle_data[:id]).to be_an(String)
      expect(puzzle_data[:id]).to eq puzzle.id.to_s

      expect(puzzle_data[:attributes]).to have_key(:user_id)
      expect(puzzle_data[:attributes][:user_id]).to be_an(Integer)
      expect(puzzle_data[:attributes][:user_id]).to eq user.id

      expect(puzzle_data[:attributes]).to have_key(:image)
      expect(puzzle_data[:attributes][:image]).to be_a(String)
      expect(puzzle_data[:attributes][:image]).to eq 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-little-friends-new-york_5274230_4_1800x1800.jpg?v=1638227460'

      expect(puzzle_data[:attributes]).to have_key(:category)
      expect(puzzle_data[:attributes][:category]).to be_a(String)
      expect(puzzle_data[:attributes][:category]).to eq 'Mystery'

      expect(puzzle_data[:attributes]).to have_key(:piece_count)
      expect(puzzle_data[:attributes][:piece_count]).to be_a(String)
      expect(puzzle_data[:attributes][:piece_count]).to eq '5000'

      expect(puzzle_data[:attributes]).to have_key(:missing_pieces)
      expect(puzzle_data[:attributes][:missing_pieces]).to be_a(String)
      expect(puzzle_data[:attributes][:missing_pieces]).to eq '0'

      expect(puzzle_data[:attributes]).to have_key(:availability)
      expect(puzzle_data[:attributes][:availability]).to eq true

      expect(puzzle_data[:attributes]).to have_key(:quality)
      expect(puzzle_data[:attributes][:quality]).to be_a(String)
      expect(puzzle_data[:attributes][:quality]).to eq 'Good'

      expect(puzzle_data[:attributes]).to have_key(:original_price_point)
      expect(puzzle_data[:attributes][:original_price_point]).to be_a(String)
      expect(puzzle_data[:attributes][:original_price_point]).to eq '35.99'
    end
  end

  describe 'POST /api/v1/puzzles' do
    let!(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }

    it 'should create a new puzzle' do
      puzzle_params = { 
        user_id: user.id,
        image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-obuhanych-cat_5274227_5_1800x1800.jpg?v=1639082053',
        category: 'Animals',
        piece_count: 1000,
        missing_pieces: '2',
        availability: true,
        quality: 'Good',
        original_price_point: '32.99'
      }
  
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/puzzles', headers: headers, params: JSON.generate(puzzle_params)

      expect(response).to be_successful

      puzzle_data = JSON.parse(response.body, symbolize_names: :true)[:data][:attributes]

      expect(puzzle_data[:image]).to eq 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-obuhanych-cat_5274227_5_1800x1800.jpg?v=1639082053'
      expect(puzzle_data[:category]).to eq 'Animals'
      expect(puzzle_data[:piece_count]).to eq '1000'
      expect(puzzle_data[:missing_pieces]).to eq '2'
      expect(puzzle_data[:availability]).to eq true
      expect(puzzle_data[:quality]).to eq 'Good'
      expect(puzzle_data[:original_price_point]).to eq '32.99'
    end
  end

  # describe 'PATCH /api/v1/puzzles/:id' do
  #   let!(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }

  #   let!(:puzzle1) { user.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Good', original_price_point: '35.99') }

  #   headers = {"CONTENT_TYPE" => "application/json"}

  #   before { patch "/api/v1/puzzles/#{puzzle1.id}", headers: headers }

  #   it 'should update the puzzles availability' do
  #     expect(response).to be_successful

  #     availability = JSON.parse(response.body, symbolize_names: :true)[:data][:attributes][:availability]

  #     expect(availability).to eq false
  #   end
  # end

  describe 'DELETE /api/v1/puzzles/:id' do
    let!(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }

    let!(:puzzle1) { user.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, quality: 'Good', original_price_point: '35.99') }

    it 'should delete the specified puzzle' do
      delete "/api/v1/puzzles/#{puzzle1.id}"

      expect(response).to be_successful
      expect(Puzzle.all.count).to eq 0
    end
  end
end