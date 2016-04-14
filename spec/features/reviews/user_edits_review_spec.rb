require "rails_helper"

feature "user edits a review" do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: "janedoe@gmail.com") }
  let!(:bar) { FactoryGirl.create(:bar, user: user1) }
  let!(:review1) { FactoryGirl.create(:review, user: user1, bar: bar) }
  let(:review2) do
    FactoryGirl.create(:review,
    user: user1, bar: bar,
    title: "Worst bar ever.",
    body: "My freinds and I had a horible time here.",
    rating: 1)
  end

  scenario "authenticated user successfully edits a review" do
    visit bars_path
    page.find(".dropbtn").click
    click_link "Sign in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"
    click_link bar.name
    click_button "Edit"

    fill_in "Title", with: review2.title
    fill_in "Review", with: review2.body
    select "3", from: "Rating"
    click_button "Save Changes"

    expect(page).to have_content review2.title
    expect(page).to have_content review2.body
    expect(page).to have_content("Rating: #{review2.rating}")
    expect(page).not_to have_content review1.title
    expect(page).not_to have_content review1.body
    expect(page).not_to have_content("Rating: #{review1.rating}")
  end

  scenario "authenticated user submits form without title or body" do
    visit bars_path
    page.find(".dropbtn").click
    click_link "Sign in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"
    click_link bar.name
    click_button "Edit"

    fill_in "Title", with: ""
    fill_in "Review", with: ""
    click_button "Save Changes"

    expect(page).to have_content("Edit Review")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

  scenario "authenticated user edits another user's review" do
    visit bars_path
    page.find(".dropbtn").click
    click_link "Sign in"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    click_link bar.name

    expect(page).to have_no_selector(:button, "Edit")
  end
end
