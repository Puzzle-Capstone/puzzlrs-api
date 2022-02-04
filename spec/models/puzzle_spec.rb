require 'rails_helper'

RSpec.describe Puzzle do
  describe 'validations' do
    it { should validate_presence_of :image }
    it { should validate_presence_of :category }
    it { should validate_presence_of :piece_count }
    it { should validate_presence_of :availability }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :requests }
  end
end