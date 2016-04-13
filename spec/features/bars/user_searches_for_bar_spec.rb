require "rails_helper"

feature "user searches for a bar" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:bar1) { FactoryGirl.create(:bar, user: user1) }
  let!(:bar2) do
    FactoryGirl.create(:bar,
    name: "The Yard House",
    description: "A brewhouse near fenway where you can buy yards of beer.",
    user: user1)
  end

  before(:each) do
    visit user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"
  end

  scenario "user gets matching search results" do
    fill_in "search", with: "Yard"
    click_button "Search"

    expect(page).to have_no_content("Game On")
    expect(page).to have_content("The Yard House")
  end

  scenario "user get no matching search results" do
    fill_in "search", with: "Z"
    click_button "Search"

    expect(page).to have_content("No results match your criteria")
  end
end
