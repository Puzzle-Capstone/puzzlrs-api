class PuzzleSerializer
  include JSONAPI::Serializer

  attributes :user_id, :image, :category, :piece_count, :missing_pieces, :availability, :quality, :original_price_point
end