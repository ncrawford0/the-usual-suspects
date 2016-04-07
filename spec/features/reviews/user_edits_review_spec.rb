require "rails_helper"

feature "user edits a review" do
  let!(:new_user) { User.create(email: "mckelvey.matt@gmail.com", password: "12345678") }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: new_user.email
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
    click_button "Edit"
    fill_in "Title", with: "Worst bar I've been to"
    fill_in "Review", with: "We were visiting and had a horrible time"
    fill_in "Rating", with: 1
    click_button "Save Changes"

    expect(page).to have_content("Review updated.")
    expect(page).to have_content("Worst bar I've been to")
    expect(page).to have_content("We were visiting and had a horrible time")
    expect(page).to have_content(1)
  end

  scenario "submits form without title, body, or rating" do
    click_button "Edit"
    fill_in "Title", with: ""
    fill_in "Review", with: ""
    fill_in "Rating", with: ""
    click_button "Save Changes"

    expect(page).to have_content("Edit Review")
    expect(page).to have_content("Title can't be blank.")
    expect(page).to have_content("Body can't be blank.")
    expect(page).to have_content("Rating can't be blank.")
    expect(page).to have_content("Rating is not a number.")
    expect(page).to have_content("Rating is not included in the list")
  end
end
