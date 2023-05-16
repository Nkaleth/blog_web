require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 5, author_id: user.id) }

  before do
    user.update(post_counter: posts.count)
    visit user_posts_path(user)
  end

  scenario "I can see the user's profile picture and the user's name and number of posts" do
    expect(page).to have_css("img[src*='#{user.photo}']").and have_content(user.name)
      .and have_content("Number of posts:#{user.post_counter}")
  end

  scenario "I can see a post's title and body, number of posts and comments and pagination section" do
    posts.each do |post|
      expect(page).to have_content(post.title).and have_content(post.text.truncate(100))
        .and have_content("Comments: #{post.comments.count}")
        .and have_content("Likes: #{post.likes.count}")
        .and have_button('Pagination')
    end
  end

  scenario 'I can see the first comments on a post' do
    posts.each do |post|
      post.five_recent_comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    first_post = posts.first
    find('section', text: first_post.text).find(:xpath, '..').click
    expect(current_path).to eq(user_post_path(user, first_post))
  end
end
