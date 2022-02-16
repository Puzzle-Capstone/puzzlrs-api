class Puzzle < ApplicationRecord
  belongs_to :user
  has_many :requests, :dependent => :destroy
  validates_presence_of :image, :category, :piece_count, :availability
end
