require "rails_helper"

feature "user deletes a review" do
  let!(:new_user) { User.create(email: "mckelvey.matt@gmail.com", password: "12345678") }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: "mckelvey.matt@gmail.com"
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
end
