require 'rails_helper'

RSpec.describe Trip do
  let(:trip) { FactoryBot.build(:trip) }

  describe 'when creating a trip' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(trip).to be_valid
      end
    end

    context 'Checking Validations for Ticket Price Attribute' do
      it { should validate_presence_of(:ticket_price) }
      it {
        should validate_numericality_of(:ticket_price).is_greater_than(0).is_less_than_or_equal_to(10_000)
      }
    end

    context 'Checking Validations for Total Booked Attribute' do
      it { should validate_presence_of(:total_booked) }
      it { should validate_numericality_of(:total_booked).is_greater_than_or_equal_to(0) }
    end

    context 'Checking Validations for Date and Time Attributes' do
      it { should validate_presence_of(:date) }
      it { should validate_presence_of(:time) }
    end

    context 'Checking Associations' do
      it { should belong_to(:bus).optional }
      it { should belong_to(:route).optional }
      it { should have_many(:tickets) }
      it { should have_many(:boardings) }
      it { should have_many(:boarding_points) }
      it { should have_many(:seats) }
    end
  end
end
