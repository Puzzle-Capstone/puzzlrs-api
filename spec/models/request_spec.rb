require 'rails_helper'

RSpec.describe Request do
  describe 'validations' do
    it { should validate_presence_of :status }
    it { should validate_presence_of :body }
  end

  describe 'relationships' do
    it { should belong_to :puzzle }
    it { should belong_to :user }
  end
end