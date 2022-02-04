# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: 'password', address: Faker::Address.full_address)
end

micha = User.create(username: 'Micha', email: 'michajbernhard@gmail.com', password: 'password', address: Faker::Address.full_address)
chloe = User.create(username: 'Chloe', email: 'chloell@protonmail.ch', password: 'password', address: Faker::Address.full_address)
tovar = User.create(username: 'Tovar', email: 'jose.tovar102397@gmail.com', password: 'password', address: Faker::Address.full_address)
kyra = User.create(username: 'Kyra', email: 'k.bergsund@gmail.com', password: 'password', address: Faker::Address.full_address)
carly = User.create(username: 'Carly', email: 'carlycollums@gmail.com', password: 'password', address: Faker::Address.full_address)

5.times do
  micha.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, description: Faker::Lorem.sentence, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, difficulty: 'Medium', quality: 'Good')
end

5.times do
  chloe.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, description: Faker::Lorem.sentence, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, difficulty: 'Extra Hard', quality: 'Excellent')
end
5.times do
  tovar.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, description: Faker::Lorem.sentence, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, difficulty: 'Easy', quality: 'Poor')
end
5.times do
  kyra.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, description: Faker::Lorem.sentence, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, difficulty: 'Hard', quality: 'Excellent')
end
5.times do
  carly.puzzles.create(image: Faker::LoremFlickr.image(search_terms: ['puzzle']), category: Faker::Book.genre, description: Faker::Lorem.sentence, piece_count: Faker::Number.between(from: 500, to: 5000), missing_pieces: Faker::Number.between(from: 0, to: 50), availability: true, difficulty: 'Hard', quality: 'Excellent')
end