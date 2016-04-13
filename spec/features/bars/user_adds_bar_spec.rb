require "rails_helper"

feature "user adds a bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }


  before(:each) do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "authenticated user successfully creates a new bar" do
    click_button "Add New Bar"
    fill_in "Name", with: bar.name
    fill_in "Description", with: bar.description
    click_button "Add Bar"

    expect(page).to have_content(bar.description)
  end

  scenario "authenticated user submits form without a name or description" do
    click_button "Add New Bar"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Add Bar"

    expect(page).to have_content("Add Bar")
    expect(page).to have_content("Name can't be blank. Description can't be blank")
  end

  scenario "unauthenticated user submits form" do
    page.find(".dropbtn").click
    click_link "Sign out"
    click_button "Add New Bar"

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
