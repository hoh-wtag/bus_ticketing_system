require "rails_helper"

RSpec.describe Seat, type: :model do
  let(:seat) { FactoryBot.build(:seat) }
  describe "when creating a seat" do
    it "has a valid factory" do
      expect(seat).to be_valid
    end
    it { should validate_presence_of(:seat_code) }
    it { should validate_presence_of(:seat_status) }
    it { should allow_value("A3").for(:seat_code) }
    it { should_not allow_value("A 3").for(:seat_code) }
    it { should_not allow_value("").for(:seat_code) }
  end
end
