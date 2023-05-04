require "rails_helper"

RSpec.describe Route, type: :model do
  let(:route) { FactoryBot.create(:route) }
  describe "when creating a route" do
    it "has a valid factory" do
      expect(route).to be_valid
    end
    it { should validate_presence_of(:source) }
    it { should validate_presence_of(:destination) }
    it { should allow_value("letteronly").for(:source) }
    it { should_not allow_value("123with0number").for(:source) }
    it { should_not allow_value("").for(:source) }
    it { should allow_value("letteronly").for(:destination) }
    it { should_not allow_value("123with0number").for(:destination) }
    it { should_not allow_value("").for(:destination) }

    it { should have_many(:trips) }
  end
end
