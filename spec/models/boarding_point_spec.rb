require "rails_helper"

RSpec.describe BoardingPoint do
  let!(:boarding_point) { FactoryBot.create(:boarding_point) }
  describe "when creating a boarding point" do
    it "has a valid factory" do
      expect(boarding_point).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should allow_value("letter only").for(:name) }
    it { should_not allow_value("123with0number").for(:name) }
    it { should_not allow_value("").for(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
