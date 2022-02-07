require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_uniqueness_of :username }
    it { should allow_value("test@test.com").for(:email) }
    it { should_not allow_value("Inv4lid_").for(:email) }
  end

  describe 'relationships' do
    it { should have_many :puzzles }
    it { should have_many :requests }
  end
end