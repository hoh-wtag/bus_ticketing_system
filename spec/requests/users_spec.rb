require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /signup' do
    let(:valid_params) do
      { user: attributes_for(:user, password: 'Aa@1bcde', password_confirmation: 'Aa@1bcde') }
    end

    let(:invalid_params) do
      {
        user: {
          first_name: 'Hasibul',
          last_name:  'Hoque',
          email:      'hasib_wrong_email',
          user_name:  'hasibulhoque',
          password:   'wrong_password',
          phone:      '+880155555555'
        }
      }
    end

    it 'should render the signup form' do
      get '/signup'
      expect(response).to render_template('users/new')
    end

    context 'when the request is valid' do
      it 'creates a new user' do
        expect do
          post '/signup', params: valid_params
        end.to change(User, :count).by(1)
      end
    end

    context 'when the request is invalid' do
      it 'does not create a new user' do
        expect do
          post '/signup', params: invalid_params
        end.to_not change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'POST /signin' do
    let!(:users) { create(:user, password: 'Aa@1bcde', password_confirmation: 'Aa@1bcde') }
    let(:valid_params) {  { email: users.email, password: users.password } }
    let(:invalid_params) {  { email: users.email, password: 'abcdefgh' } }
    it 'should render the signin form' do
      get '/signin'
      expect(response).to render_template('sessions/new')
    end

    it 'should Sign In user with valid parameters' do
      post '/signin', params: valid_params
      expect(session[:user_id]).to eq(users.id)
      expect(response).to have_http_status(:see_other)
    end

    it 'should not Sign In user with invalid parameters' do
      post '/signin', params: invalid_params
      expect(session[:user_id]).to eq(nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /signout' do
    it 'should sign out' do
      delete '/signout'
      expect(session[:user_id]).to eq(nil)
      expect(response).to have_http_status(:see_other)
    end
  end
end
