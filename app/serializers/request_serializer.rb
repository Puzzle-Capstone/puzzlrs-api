class RequestSerializer
  include JSONAPI::Serializer

  attributes :user_id, :puzzle_id, :status
end
