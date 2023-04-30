require 'rails_helper'

RSpec.describe Route, type: :model do
  let(:route) { FactoryBot.create(:route) }
  describe 'when creating a route' do
    it 'has a valid factory' do
      expect(route).to be_valid
    end
    it { should validate_presence_of(:route_source) }
    it { should validate_presence_of(:route_destination) }
    it { should allow_value('letteronly').for(:route_source) }
    it { should_not allow_value('123with0number').for(:route_source) }
    it { should allow_value('letteronly').for(:route_destination) }
    it { should_not allow_value('123with0number').for(:route_destination) }
  end
end