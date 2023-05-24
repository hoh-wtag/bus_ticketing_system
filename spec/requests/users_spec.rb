require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_up' do
    it 'should render the new sign up form' do
      get '/users/sign_up'
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /users' do
    let(:valid_params) { { user: attributes_for(:user) } }
    it 'creates a new user' do
      expect do
        post '/users', params: valid_params
      end.to change(User, :count).by(1)
      expect(response).to have_http_status(:see_other)
    end
  end

  describe 'GET /users/sign_in' do
    let(:valid_params) { { user: attributes_for(:user) } }
    it 'should render the new sign in form' do
      get '/users/sign_in'
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /users/sign_in' do
    let(:user1) { create(:user) }
    it 'should signin the user' do
      post '/users/sign_in', params: { user: { email: user1.email, password: user1.password } }
      expect(controller.current_user).to eq(user1)
      expect(response).to have_http_status(:see_other)
    end
  end
end
