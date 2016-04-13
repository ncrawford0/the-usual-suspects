require "rails_helper"

feature "user adds a review to bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }
  let(:review) { FactoryGirl.create(:review, user: user, bar: bar) }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_link bar.name
  end

  scenario "authenticated user successfully creates a new review" do
    fill_in "Title", with: review.title
    fill_in "Review", with: review.body
    fill_in "Rating", with: review.rating
    click_button "Create Review"

    expect(page).to have_content review.title
    expect(page).to have_content review.body
    expect(page).to have_content review.rating
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
    page.find(".dropbtn").click
    click_link "Sign out"
    click_link bar.name
    click_button "Create Review"

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
