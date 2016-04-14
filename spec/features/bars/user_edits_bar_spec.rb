require "rails_helper"

feature "user edits an existing bar" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: "janedoe@gmail.com") }
  let!(:bar1) { FactoryGirl.create(:bar, user: user1) }
  let(:bar2) do
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

  scenario "authenticated user successfully edits a bar" do
    click_link bar1.name
    click_button "Edit Bar"
    fill_in "Name", with: bar2.name
    fill_in "Description", with: bar2.description
    click_button "Update Bar"

    expect(page).to have_content bar2.name
  end

  scenario "authenticated user submits form without a name or description" do
    click_link bar1.name
    click_button "Edit Bar"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Update Bar"

    expect(page).to have_content("Edit Bar")
    expect(page).to have_content("Name can't be blank. Description can't be blank")
  end

  scenario "unauthenticated user edits bar" do
    page.find(".dropbtn").click
    click_link "Sign out"
    click_link bar1.name

    expect(page).to have_no_content("Edit Bar")
  end

  scenario "authenticated user edits another user's bar" do
    page.find(".dropbtn").click
    click_link "Sign out"
    page.find(".dropbtn").click
    click_link "Sign in"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    click_link bar1.name

    expect(page).to have_no_content("Edit Bar")
  end
end
