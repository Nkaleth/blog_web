require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: 'johndoe', post_counter: 0) }
    it 'returns http success' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Detailed posts for this user:')
    end
  end

  describe 'GET /show' do
    let(:author) { User.create(name: 'johndoe', post_counter: 0) }
    let(:post) { Post.create!(title: 'My Post', comments_counter: 0, likes_counter: 0, author:) }

    it 'returns http success' do
      get "/users/:user_id/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/:user_id/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get "/users/:user_id/posts/#{post.id}"
      expect(response.body).to include('Here is the details of a given user of his post with')
    end
  end
end
