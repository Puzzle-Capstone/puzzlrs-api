# require "rails_helper"
# require "../puzzlrs-api/app/controllers/api/v1/requests_controller.rb"
#
# RSpec.describe RequestNotificationMailer, type: :mailer do
#   describe 'request notification' do
#     let(:user) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }
#     let(:user2) { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, address: Faker::Address.full_address) }
#     let(:puzzle) { user2.puzzles.create(image: 'https://cdn.shopify.com/s/files/1/0279/7325/5307/products/puzzle-500-piece-obuhanych-cat_5274227_5_1800x1800.jpg?v=1639082053', category: 'Animals', piece_count: 500, missing_pieces: '2', availability: true, quality: 'fabulous', original_price_point: '32.99') }
#     let(:test_mail) { RequestNotificationMailer.request_notification_email }
#
#     it 'renders the email' do
#       request_params = {
#         user_id: user2.id,
#         puzzle_id: puzzle.id
#       }
# binding.pry
#       post 'localhost:3000/api/v1/requests', params: request_params.to_json
#     binding.pry
#       expect(test_mail.subject).to eq("Puzzlrs: A request is in for one of your puzzles!")
#       expect(test_mail.from).to eq(["puzzlrmailer@gmail.com"])
#       expect(test_mail.to).to eq([user.email])
#     end
#   end
# end
