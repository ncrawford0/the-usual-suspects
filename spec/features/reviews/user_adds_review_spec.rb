require "rails_helper"

feature "user adds a review to bar" do
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
  end

  scenario "authenticated user successfully creates a new review" do
    fill_in "Title", with: "Best bar I've been to"
    fill_in "Review", with: "We were visiting and had a good time"
    fill_in "Rating", with: 5
    click_button "Create Review"

    expect(page).to have_content("Review added")
    expect(page).to have_content("Best bar I've been to")
    expect(page).to have_content("5")
  end

  scenario "authenticated user submits form without title, body, or rating" do
    fill_in "Title", with: ""
    fill_in "Review", with: ""
    fill_in "Rating", with: ""
    click_button "Create Review"

    expect(page).to have_content("Title can't be blank.")
    expect(page).to have_content("Body can't be blank.")
    expect(page).to have_content("Rating can't be blank.")
    expect(page).to have_content("Rating is not a number.")
    expect(page).to have_content("Rating is not included in the list")
  end

  scenario "unauthenticated user adds review" do
    click_button "Sign out"
    click_link "Beantown Pub"
    click_button "Edit Bar"

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
