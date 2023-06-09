require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/'
      expect(response.body).to include("User's Lists")
    end

    describe 'GET /show' do
      it 'returns http success' do
        get '/users/:user_id/'
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get '/users/:user_id/'
        expect(response).to render_template(:show)
      end

      it 'includes the correct placeholder text' do
        get '/users/:user_id/'
        expect(response.body).to include('User does not exist!')
      end
    end
  end
end
