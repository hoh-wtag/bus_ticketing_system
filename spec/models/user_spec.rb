require 'rails_helper'

RSpec.describe User do
  let(:user) { FactoryBot.create(:user) }
  subject { build(:user) }

  describe 'when creating a user' do
    it 'has a valid factory' do
      expect(user).to be_valid
    end
    context 'Checking Validations for First Name Attribute' do
      it { should validate_presence_of(:first_name) }
      it { should allow_value('AbcdEf').for(:first_name) }
      it { should_not allow_value('Abcd1234').for(:first_name) }
      it { should_not allow_value('').for(:first_name) }
    end
    context 'Checking Validations for Last Name Attribute' do
      it { should validate_presence_of(:last_name) }
      it { should allow_value('AbcdEf').for(:last_name) }
      it { should_not allow_value('Abcd1234').for(:last_name) }
      it { should_not allow_value('').for(:last_name) }
    end
    context 'Checking Validations for Email Attribute' do
      it { should validate_presence_of(:email) }
      it { should allow_value('customer@email.com').for(:email) }
      it { should_not allow_value('invalid-email').for(:email) }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
    context 'Checking Validations for Password Attribute' do
      it { should validate_presence_of(:password) }
      it { should allow_value('Aa@1bcde').for(:password) }
      it { should_not allow_value('AbcDefaaaaaaa').for(:password) }
      it { should_not allow_value('').for(:password) }
    end
    context 'Checking Validations for Phone Attribute' do
      it { should validate_presence_of(:phone) }
      it { should allow_value('+8801000000000').for(:phone) }
      it { should_not allow_value('+88010000000').for(:phone) }
      it { should_not allow_value('AbcDef').for(:phone) }
      it { should_not allow_value('').for(:phone) }
    end
    context 'Checking Validations for User Name Attribute' do
      it { should validate_presence_of(:user_name) }
      it { should validate_uniqueness_of(:user_name).case_insensitive }
      it { should_not allow_value('').for(:user_name) }
    end
    context 'Checking Validations for Role Attribute' do
      it { should validate_presence_of(:role) }
      it { should_not allow_value('').for(:role) }
      it { should define_enum_for(:role).with_values(%i[customer admin]) }
    end

    context 'Checking Associations' do
      it { should have_many(:tickets) }
    end
  end
end
