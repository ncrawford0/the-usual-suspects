require "rails_helper"

feature "user deletes a review" do
  let!(:user1) { User.create(email: "mckelvey.matt@gmail.com", password: "12345678") }
  let!(:user2) { User.create(email: "abcd4@gmail.com", password: "12345678") }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_button "Add New Bar"
    fill_in "Name", with: "Beantown Pub"
    fill_in "Description", with: "After hours cocktail bar with pool."
    click_button "Add Bar"
    fill_in "Title", with: "Best bar I've been to"
    fill_in "Review", with: "We were visiting and had a good time"
    fill_in "Rating", with: 5
    click_button "Create Review"
  end

  scenario "authenticated user successfully edits a review" do
    click_button "Delete"

    expect(page).to have_content("Review has been deleted")
    expect(page).not_to have_content("Best bar I've been to")
    expect(page).not_to have_content("We were visiting and had a good time")
    expect(page).not_to have_content(5)
  end

  scenario "user deletes another user's review" do
    click_button "Sign out"
    click_button "Sign in"
    fill_in "Email", with: user2.email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Beantown Pub"
    click_button "Delete"

    expect(page).to have_content("Beantown Pub")
    expect(page).to have_content("You do not have permission to make this change")
  end
end
