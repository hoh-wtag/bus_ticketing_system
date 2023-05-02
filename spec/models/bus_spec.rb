require "rails_helper"

RSpec.describe Bus, type: :model do
  let!(:bus) { FactoryBot.create(:bus) }
  describe "when creating a bus" do
    it "has a valid factory" do
      expect(bus).to be_valid
    end
    it { should validate_presence_of(:bus_code) }
    it { should validate_presence_of(:bus_type) }
    it { should validate_presence_of(:bus_company) }
    it { should validate_presence_of(:bus_capacity) }
    it { should validate_uniqueness_of(:bus_code).case_insensitive }
    it { should allow_value("shohagh-003").for(:bus_code) }
    it { should_not allow_value("shogagh 001").for(:bus_code) }
    it { should validate_numericality_of(:bus_capacity).is_greater_than(0).is_less_than_or_equal_to(60) }

    it { should have_many(:tickets) }
    it { should have_many(:seats) }
    it { should have_many(:trips) }
  end
end
