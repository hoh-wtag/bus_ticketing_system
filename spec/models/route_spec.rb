require 'rails_helper'

RSpec.describe Route do
  let!(:route) { FactoryBot.create(:route) }

  describe 'when creating a route' do
    context 'Checking Factory' do
      it 'has a valid factory' do
        expect(route).to be_valid
      end
    end

    context 'Checking Validations for Source Attribute' do
      it { should validate_presence_of(:source) }
      it { should allow_value('letteronly').for(:source) }
      it { should_not allow_value('123with0number').for(:source) }
      it { should_not allow_value('').for(:source) }
    end

    context 'Checking Validations for Destination Attribute' do
      it { should validate_presence_of(:destination) }
      it { should allow_value('letteronly').for(:destination) }
      it { should_not allow_value('123with0number').for(:destination) }
      it { should_not allow_value('').for(:destination) }
    end

    context 'Checking Uniqueness of a Route' do
      it { should validate_uniqueness_of(:source).scoped_to(:destination).ignoring_case_sensitivity }
    end

    context 'Checking Associations' do
      it { should have_many(:trips) }
    end
  end
end
