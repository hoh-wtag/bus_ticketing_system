require 'rails_helper'

RSpec.describe Seat do
  let(:seat) { FactoryBot.build(:seat) }

  describe 'when creating a seat' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(seat).to be_valid
      end
    end

    context 'Checking Validations for Code Attribute' do
      it { should validate_presence_of(:code) }
      it { should allow_value('A3').for(:code) }
      it { should_not allow_value('A 3').for(:code) }
      it { should_not allow_value('').for(:code) }
    end

    context 'Checking Validations for Status Attribute' do
      it { should validate_presence_of(:status) }
      it { should_not allow_value('').for(:status) }
      it { should define_enum_for(:status).with_values(%i[seat_available on_hold booked]) }
    end

    context 'Checking Associations' do
      it { should belong_to(:trip).optional }
      it { should belong_to(:ticket).optional }
    end
  end
end
