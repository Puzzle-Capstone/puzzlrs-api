class PuzzleSerializer
  include JSONAPI::Serializer

  attributes :user_id, :image, :category, :description, :piece_count, :missing_pieces, :availability, :difficulty, :quality
end