require "rails_helper"

RSpec.describe Boarding, type: :model do
  let(:boarding) { FactoryBot.build(:boarding) }
  describe "when creating a boarding" do
    it "has a valid factory" do
      expect(boarding).to be_valid
    end
    it { should validate_presence_of(:boarding_time) }
  end
end
