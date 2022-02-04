class UserSerializer
  include JSONAPI::Serializer
  set_type :users

  attributes :username

  attribute :puzzles do |i|
    i.puzzles
  end

  attribute :sent_requests do |i|
    i.requests
  end

  attribute :received_requests do |i|
    Request.all.find_all{ |j| j.puzzle.user_id == i.id }
  end
end
