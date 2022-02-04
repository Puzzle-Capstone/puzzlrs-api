class Request << ApplicationRecord
  belongs_to :puzzle
  belongs_to :user
  validates_presence_of :status, :body
end