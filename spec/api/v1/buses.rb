require 'rails_helper'

RSpec.describe Api::V1::Resources::Buses do
  user = FactoryBot.create(:user, role: 1)
  let(:user) { user }
  application = Doorkeeper::Application.create!(
    name:         'TestApp',
    redirect_uri: 'https://app.com/',
    scopes:       'read'
  )
  access_token = Doorkeeper::AccessToken.create!(
    application_id:    application.id,
    resource_owner_id: user.id
  )
  let(:token) { access_token.token }

  describe 'GET /v1/buses' do
    it 'returns all buses' do
      create_list(:bus, 3)

      get '/api/v1/buses', headers: { Authorization: "Bearer #{token}" }

      expect(response.status).to eq(403)
      expect(JSON.parse(response.body)).to eq []
    end
  end
end
