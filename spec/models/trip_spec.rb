require "rails_helper"

RSpec.describe Trip, type: :model do
  let(:trip) { FactoryBot.build(:trip) }
  describe "when creating a trip" do
    it "has a valid factory" do
      expect(trip).to be_valid
    end
    it { should validate_presence_of(:ticket_price) }
    it { should validate_presence_of(:total_booked) }
    it { should validate_presence_of(:trip_date) }
    it { should validate_presence_of(:trip_time) }
    it {
      should validate_numericality_of(:ticket_price).is_greater_than(0).is_less_than_or_equal_to(10_000)
    }
  end
end
