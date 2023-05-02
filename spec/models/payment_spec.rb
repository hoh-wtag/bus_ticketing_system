require "rails_helper"

RSpec.describe Payment, type: :model do
  let(:payment) { FactoryBot.build(:payment) }
  describe "when creating a Payment" do
    it "has a valid factory" do
      expect(payment).to be_valid
    end
    it { should have_one(:ticket) }
  end
end
