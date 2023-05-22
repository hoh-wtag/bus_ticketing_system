require 'rails_helper'

RSpec.describe BoardingPointsController, type: :controller do
  describe 'Boarding Points' do
    let!(:boarding_point) { create(:boarding_point) }
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
      get :edit, params: { id: boarding_point.id }
      expect(response).to be_successful
      expect(response).to render_template('edit')
    end
  end
end
