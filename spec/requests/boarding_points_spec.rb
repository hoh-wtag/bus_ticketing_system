require 'rails_helper'

RSpec.describe 'BoardingPoints' do
  describe 'GET /boarding_points' do
    it 'returns a success response' do
      get '/boarding_points'
      expect(response).to be_successful
    end
  end

  describe 'POST /boarding_points' do
    let(:valid_params) { { boarding_point: attributes_for(:boarding_point) } }
    let(:invalid_params) { { boarding_point: { name: '' } } }

    it 'should render the new boarding point form' do
      get '/boarding_points/new'
      expect(response).to render_template(:new)
    end

    it 'creates a new boarding point' do
      expect do
        post '/boarding_points', params: valid_params
      end.to change(BoardingPoint, :count).by(1)
    end

    it 'should not create new boarding point for invalid params' do
      expect do
        post '/boarding_points', params: invalid_params
      end.to change(BoardingPoint, :count).by(0)
    end

    it 'returns a success response' do
      post '/boarding_points', params: valid_params
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /boarding_points' do
    let(:boarding_point) { create(:boarding_point) }
    let(:valid_params) { { boarding_point: { name: 'Arambagh' } } }
    let(:invalid_params) { { boarding_point: { name: '1invalid2' } } }

    it 'should render the edit boarding point form' do
      get "/boarding_points/#{boarding_point.id}/edit"
      expect(response).to render_template(:edit)
    end

    it 'updates the boarding point' do
      put "/boarding_points/#{boarding_point.id}", params: valid_params
      boarding_point.reload
      expect(boarding_point.name).to eq('Arambagh')
    end

    it 'should not update the boarding point for invalid params' do
      put "/boarding_points/#{boarding_point.id}", params: invalid_params
      boarding_point.reload
      expect(boarding_point.name).not_to eq('1invalid2')
    end

    it 'returns a success response' do
      put "/boarding_points/#{boarding_point.id}", params: valid_params
      expect(response).to have_http_status(:see_other)
    end
  end

  describe 'DELETE /boarding_points/:id' do
    let!(:boarding_point) { create(:boarding_point) }

    it 'destroys the requested boarding point' do
      expect do
        delete "/boarding_points/#{boarding_point.id}"
      end.to change(BoardingPoint, :count).by(-1)
    end

    it 'returns a success response' do
      delete "/boarding_points/#{boarding_point.id}"
      expect(response).to have_http_status(:see_other)
    end
  end
end
