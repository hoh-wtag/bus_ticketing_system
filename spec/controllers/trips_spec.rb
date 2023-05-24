require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  describe 'Trips' do
    let!(:trip) { create(:trip) }

    before(:each) do
      admin_user = create(:user, role: 'admin')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(admin_user)
    end

    it 'renders the index template' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template('index')
    end
    it 'renders the new template' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template('new')
    end
    it 'renders the edit template' do
      get :edit, params: { id: trip.id }
      expect(response).to be_successful
      expect(response).to render_template('edit')
    end
  end
end
