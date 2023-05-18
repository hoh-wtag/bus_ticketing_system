require 'rails_helper'

RSpec.describe Boarding do
  let(:boarding) { FactoryBot.build(:boarding) }

  describe 'when creating a boarding' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(boarding).to be_valid
      end
    end

    context 'Checking Validations for Time Attribute' do
      it { should validate_presence_of(:time) }
      it 'checks if boarding time is after trip time' do
        boarding.trip.time = 1.hour.ago
        boarding.time = Time.current

        expect(boarding).to be_valid

        boarding.time = 2.hours.ago

        expect(boarding).not_to be_valid
        expect(boarding.errors[:time]).to include('must be after trip time')
      end
    end

    context 'Checking Associations' do
      it { should belong_to(:trip) }
      it { should belong_to(:boarding_point) }
      it { should have_one(:ticket) }
    end
  end
end
