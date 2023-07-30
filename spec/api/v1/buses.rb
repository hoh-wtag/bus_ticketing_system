require 'rails_helper'

RSpec.describe Api::V1::Resources::Buses do
  user = FactoryBot.create(:user, role: 1)
  let(:user) { user }
  application = Doorkeeper::Application.create!(
    name:         'TestApp',
    redirect_uri: 'https://app.com/'
  )
  access_token = Doorkeeper::AccessToken.create!(
    application_id:    application.id,
    resource_owner_id: user.id
  )
  let(:token) { access_token.token }

  describe 'GET api/v1/buses' do
    it 'returns all buses' do
      create_list(:bus, 3)
      get('/api/v1/buses', params: { access_token: token })

      expect(response.status).to eq(200)
    end
  end
  describe 'GET /v1/buses/:id' do
    let(:bus) { create(:bus) }
    it 'returns a specific bus' do
      get "/api/v1/buses/#{bus.id}", params: { access_token: token }

      expect(response).to have_http_status(200)
    end
  end
end
