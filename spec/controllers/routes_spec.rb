require 'rails_helper'

RSpec.describe RoutesController, type: :controller do
  describe 'Routes' do
    let!(:route) { create(:route) }
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
      get :edit, params: { id: route.id }
      expect(response).to be_successful
      expect(response).to render_template('edit')
    end
  end
end
