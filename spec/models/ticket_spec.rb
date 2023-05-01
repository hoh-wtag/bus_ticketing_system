require "rails_helper"

RSpec.describe Ticket, type: :model do
  let(:ticket) { FactoryBot.build(:ticket) }
  describe "when creating a ticket" do
    it "has a valid factory" do
      expect(ticket).to be_valid
    end
    it { should validate_presence_of(:total_fare) }
  end
end
