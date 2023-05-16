require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  scenario "displays all users' information" do
    # Create some test users with FactoryBot or other method
    user1 = create(:user, name: 'Tom', post_counter: 3)
    user2 = create(:user, name: 'Lilly', post_counter: 3)

    visit users_path

    # Check that the page displays the username of all other users
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)

    # Check that the page displays the profile picture for each user
    expect(page).to have_css("img[src*='#{user1.photo}']")
    expect(page).to have_css("img[src*='#{user2.photo}']")

    # Check that the page displays the number of posts each user has written
    expect(page).to have_content("Number of posts:#{user1.post_counter}")
    expect(page).to have_content("Number of posts:#{user2.post_counter}")

    # Check that when clicking on a user, the user is redirected to that user's show page
    click_link(user1.name)
    expect(current_path).to eq(user_path(user1))
  end
end
