# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address)
end

micha = User.create!(username: 'Micha', email: 'michajbernhard@gmail.com', address: Faker::Address.full_address)
chloe = User.create!(username: 'Chloe', email: 'chloell@protonmail.ch', address: Faker::Address.full_address)
tovar = User.create!(username: 'Tovar', email: 'jose.tovar102397@gmail.com', address: Faker::Address.full_address)
kyra = User.create!(username: 'Kyra', email: 'k.bergsund@gmail.com', address: Faker::Address.full_address)
carly = User.create!(username: 'Carly', email: 'carlycollums@gmail.com', address: Faker::Address.full_address)

category = ['Art', 'Animals', 'Food', 'Holidays', 'Miscellaneous', 'Mythical', 'Nature', 'People', 'Structures', 'Travel']

missing_pieces = ['1', '2', '3', '4', '5+']

quality = ['Poor', 'Fair', 'Good', 'Very Good', 'Excellent']

puzzle1 = micha.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-obuhanych-cat_5274227_5_1800x1800.jpg?v=1639082053', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '32.99')
puzzle2 = micha.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-listfield-rainbow_5274224_4_1800x1800.jpg?v=1638228235', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '33.99')
puzzle3 = micha.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5280376.PT02_1800x1800.jpg?v=1638228991', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '34.99')
puzzle4 = micha.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5280371.PT02_1800x1800.jpg?v=1638227951', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '35.99')
puzzle5 = micha.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-dardik-capetown_5274234_5_1800x1800.jpg?v=1638227078', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '36.99')

puzzle6 = chloe.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-hewitt-queen-bee_5274233_5_1800x1800.jpg?v=1639081397', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '25.99')
puzzle7 = chloe.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-little-friends-san-francisco_5274229_6_1800x1800.jpg?v=1638227609', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '26.99')
puzzle8 = chloe.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-little-friends-new-york_5274230_4_1800x1800.jpg?v=1638227460', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '27.99')
puzzle9 = chloe.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5289254_1800x1800.jpg?v=1642088069', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '28.99')
puzzle10 = chloe.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5280372.PT02_1800x1800.jpg?v=1638228831', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '29.99')

puzzle11 = tovar.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5281184.PT02_1800x1800.jpg?v=1640110860', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '10.99')
puzzle12 = tovar.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-mcdevitt-how-2-greet_5274226_5_1800x1800.jpg?v=1642088482', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '11.99')
puzzle13 = tovar.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5289253_1800x1800.jpg?v=1640111069', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '12.99')
puzzle14 = tovar.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5280366.PT02_1800x1800.jpg?v=1643907287', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '13.99')
puzzle15 = tovar.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-saelinger-icepops_5274223_6_1800x1800.jpg?v=1643213194', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '14.99')

puzzle16 = kyra.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5281199.PT02_1800x1800.jpg?v=1643212628', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '45.99')
puzzle17 = kyra.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/5280367.PT02_1800x1800.jpg?v=1642088182', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '46.99')
puzzle18 = kyra.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/TGI_Puzzle_Web_V1A_1_590x_2a34b9a7-bc51-45b8-be33-4a528542e0b3_1800x1800.png?v=1643906131', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '47.99')
puzzle19 = kyra.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/PZTFRV_1800x1800.jpg?v=1643497009', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '48.99')
puzzle20 = kyra.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/TGI_Puzzle_Web_V2A_1_590x_3e3a7779-8693-4880-827a-0ea5f553fe5c_1800x1800.png?v=1643906282', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '49.99')

puzzle21 = carly.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/TGI_Puzzle_Web_V3A_1_590x_e97045d6-4bbf-4c9b-9f5e-e76c4d64672a_1800x1800.png?v=1643906384', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '51.99')
puzzle22 = carly.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-1000-piece-little-friends-san-francisco_5274229_6_1800x1800.jpg?v=1638227609', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '52.99')
puzzle23 = carly.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/ScreenShot2021-10-25at2.32.50PM_1800x1800.png?v=1635186844', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '53.99')
puzzle24 = carly.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/ScreenShot2021-10-25at2.28.12PM_1800x1800.png?v=1635186532', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '54.99')
puzzle25 = carly.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/PUZZ-PMU-SAFARI_2048x2048_42fbff8c-b883-4d66-9d62-b79e0ea5fcb5_1800x1800.jpg?v=1636574275', category: category.sample, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: missing_pieces.sample, availability: true, quality: quality.sample, original_price_point: '55.99')

micha.requests.create(puzzle_id: puzzle6.id, status: 'Pending')
micha.requests.create(puzzle_id: puzzle11.id, status: 'Pending')
micha.requests.create(puzzle_id: puzzle16.id, status: 'Pending')
micha.requests.create(puzzle_id: puzzle21.id, status: 'Pending')

chloe.requests.create(puzzle_id: puzzle1.id, status: 'Pending')
chloe.requests.create(puzzle_id: puzzle12.id, status: 'Pending')
chloe.requests.create(puzzle_id: puzzle17.id, status: 'Pending')
chloe.requests.create(puzzle_id: puzzle22.id, status: 'Pending')

tovar.requests.create(puzzle_id: puzzle2.id, status: 'Pending')
tovar.requests.create(puzzle_id: puzzle7.id, status: 'Pending')
tovar.requests.create(puzzle_id: puzzle18.id, status: 'Pending')
tovar.requests.create(puzzle_id: puzzle23.id, status: 'Pending')

kyra.requests.create(puzzle_id: puzzle3.id, status: 'Pending')
kyra.requests.create(puzzle_id: puzzle8.id, status: 'Pending')
kyra.requests.create(puzzle_id: puzzle13.id, status: 'Pending')
kyra.requests.create(puzzle_id: puzzle24.id, status: 'Pending')

carly.requests.create(puzzle_id: puzzle4.id, status: 'Pending')
carly.requests.create(puzzle_id: puzzle9.id, status: 'Pending')
carly.requests.create(puzzle_id: puzzle14.id, status: 'Pending')
carly.requests.create(puzzle_id: puzzle19.id, status: 'Pending')