require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Sign up' do
    it 'renders the Sign up template' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template('new')
    end
  end
end
