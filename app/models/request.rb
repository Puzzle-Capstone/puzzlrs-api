class Request < ApplicationRecord
  belongs_to :puzzle
  belongs_to :user
  validates_presence_of :status, :user_id, :puzzle_id
  validates_inclusion_of :status, in: %w( pending accepted declined ), message: "Not a valid status"
end
