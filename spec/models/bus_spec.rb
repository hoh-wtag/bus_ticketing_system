require 'rails_helper'

RSpec.describe Bus do
  let!(:bus) { FactoryBot.create(:bus) }

  describe 'when creating a bus' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(bus).to be_valid
      end
    end

    context 'Checking Validations for Code Attribute' do
      it { should validate_presence_of(:code) }
      it { should validate_uniqueness_of(:code).case_insensitive }
      it { should allow_value('shohagh-003').for(:code) }
      it { should_not allow_value('shogagh 001').for(:code) }
      it { should_not allow_value('').for(:code) }
    end

    context 'Checking Validations for Bus Type Attribute' do
      it { should validate_presence_of(:bus_type) }
      it { should_not allow_value('').for(:bus_type) }
      it { should define_enum_for(:bus_type).with_values(%i[ac non_ac]) }
    end

    context 'Checking Validations for Capacity Attribute' do
      it { should validate_presence_of(:capacity) }
      it { should validate_numericality_of(:capacity).is_greater_than(0).is_less_than_or_equal_to(60) }
    end

    context 'Checking Validations for Company Attribute' do
      it { should validate_presence_of(:company) }
    end

    context 'Checking Associations' do
      it { should have_many(:tickets) }
      it { should have_many(:trips) }
    end
  end
end
