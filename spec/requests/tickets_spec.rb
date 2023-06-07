require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  let(:user) { create :user }
  let!(:trip) { create :trip }
  let!(:seat) { create(:seat, trip:) }

  before(:each) do
    user.role = :admin
    sign_in(user)
  end
  describe 'GET /searc' do
    it 'returns a success response' do
      get '/search'
      expect(response).to be_successful
    end
    it 'expect rendering index page' do
      get '/search'
      expect(response).to render_template('tickets/index')
    end
  end

  describe 'GET /book_seats/:id' do
    it 'expect rendering index page' do
      get "/book_seats/#{trip.id}"
      expect(response).to render_template('tickets/book_seats')
    end

    it 'expect returned bus is assiciated with trip' do
      get "/book_seats/#{trip.id}"
      expect(assigns(:bus)).to eq(trip.bus)
    end
  end

  describe 'POST /payment' do
    let(:valid_params) { { trip_id: trip.id, "#{seat.id}": seat.id } }
    it 'should update session' do
      post '/payment', params: valid_params
      expect(session[:seats].last).to eq(seat.id.to_s)
      expect(session[:trip]).to eq(trip.id.to_s)
      expect(response).to have_http_status(:see_other)
    end
    it 'should redirect session' do
      post '/payment', params: valid_params
      expect(response).to redirect_to(:process_payment)
    end
  end
end
