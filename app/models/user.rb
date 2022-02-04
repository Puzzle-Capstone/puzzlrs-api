class User << ApplicationRecord
  has_many :puzzles
  has_many :requests
  validates_presence_of :username, :email, :password
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end