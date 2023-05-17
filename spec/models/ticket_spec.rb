require 'rails_helper'

RSpec.describe Ticket do
  let(:ticket) { FactoryBot.build(:ticket) }

  describe 'when creating a ticket' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(ticket).to be_valid
      end
    end

    context 'Checking Validations for Total Fare Attribute' do
      it { should validate_presence_of(:total_fare) }
    end

    context 'Checking Associations' do
      it { should belong_to(:user) }
      it { should belong_to(:trip).optional }
      it { should belong_to(:bus).optional }
      it { should belong_to(:payment) }
      it { should belong_to(:boarding) }
      it { should have_many(:seats) }
    end
  end
end
