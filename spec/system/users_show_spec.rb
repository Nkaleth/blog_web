require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let(:user) { create(:user, bio: 'My bio') }
  let!(:posts) { create_list(:post, 5, author_id: user.id) }

  before do
    visit user_path(user)
  end

  scenario "I can see the user's profile picture, username, number of posts, and bio" do
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts:#{user.posts.count}")
    expect(page).to have_content(user.bio)
  end

  scenario "I can see the user's first 3 posts" do
    user.three_first_posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all posts', href: user_posts_path(user))
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    first_post = user.three_first_posts.first
    find('section', text: first_post.text).find(:xpath, '..').click
    expect(current_path).to eq(user_post_path(user, first_post))
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_on 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
