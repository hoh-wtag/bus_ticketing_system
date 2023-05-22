require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'Home' do
    it 'renders the Home template' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template('index')
    end
  end
end
