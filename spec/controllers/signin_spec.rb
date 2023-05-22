require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'Sign in' do
    it 'renders the Sign in template' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template('new')
    end
  end
end
