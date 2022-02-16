class User < ApplicationRecord
  has_many :puzzles
  has_many :requests, :dependent => :destroy
  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
