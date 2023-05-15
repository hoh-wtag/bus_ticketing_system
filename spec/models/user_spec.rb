require 'rails_helper'

RSpec.describe User do
  let(:user) { FactoryBot.create(:user) }
  subject { build(:user) }

  describe 'when creating a user' do
    it 'has a valid factory' do
      expect(user).to be_valid
    end
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:role) }
    it { should allow_value('customer@email.com').for(:email) }
    it { should_not allow_value('invalid-email').for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:user_name).case_insensitive }
    it { should allow_value('AbcdEf').for(:first_name) }
    it { should_not allow_value('Abcd1234').for(:first_name) }
    it { should allow_value('AbcdEf').for(:last_name) }
    it { should_not allow_value('Abcd1234').for(:last_name) }
    it { should allow_value('+8801000000000').for(:phone) }
    it { should_not allow_value('+88010000000').for(:phone) }
    it { should_not allow_value('AbcDef').for(:phone) }
    it { should allow_value('Aa@1bcde').for(:password) }
    it { should_not allow_value('AbcDefaaaaaaa').for(:password_digest) }
    it { should_not allow_value('').for(:first_name) }
    it { should_not allow_value('').for(:last_name) }
    it { should_not allow_value('').for(:password_digest) }
    it { should_not allow_value('').for(:phone) }
    it { should_not allow_value('').for(:user_name) }
    it { should_not allow_value('').for(:role) }

    it { should have_many(:tickets) }
  end
end
