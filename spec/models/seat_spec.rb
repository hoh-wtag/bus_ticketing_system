require 'rails_helper'

RSpec.describe Seat do
  let(:seat) { FactoryBot.build(:seat) }
  describe 'when creating a seat' do
    it 'has a valid factory' do
      expect(seat).to be_valid
    end
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:status) }
    it { should allow_value('A3').for(:code) }
    it { should_not allow_value('A 3').for(:code) }
    it { should_not allow_value('').for(:code) }
    it { should_not allow_value('').for(:status) }

    it { should belong_to(:trip).optional }
    it { should belong_to(:ticket).optional }
  end
end
