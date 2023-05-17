require 'rails_helper'

RSpec.describe Payment do
  let(:payment) { FactoryBot.build(:payment) }

  describe 'when creating a Payment' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(payment).to be_valid
      end
    end

    context 'Checking Associations' do
      it { should have_one(:ticket) }
    end
  end
end
