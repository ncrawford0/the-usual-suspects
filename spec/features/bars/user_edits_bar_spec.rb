require "rails_helper"

feature "user edits an existing bar" do
  let!(:user1) { User.create(email: "abcd2@gmail.com", password: "12345678") }
  let!(:user2) { User.create(email: "abcd4@gmail.com", password: "12345678") }
  let!(:bar1) { Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?", user: user1) }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: "abcd2@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
  end

  scenario "authenticated user successfully edits a bar" do
    click_link "Happy Hour Lasagna"
    click_button "Edit Bar"
    fill_in "Name", with: "This is the new bar"
    fill_in "Description", with: "The best place for a happy hour."
    click_button "Update Bar"

    expect(page).to have_content("This is the new bar")
  end

  scenario "authenticated user submits form without a name or description" do
    click_link "Happy Hour Lasagna"
    click_button "Edit Bar"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Update Bar"

    expect(page).to have_content("Edit Bar")
    expect(page).to have_content("Name can't be blank. Description can't be blank")
  end

  scenario "unauthenticated user edits bar" do
    click_button "Sign out"
    click_link "Happy Hour Lasagna"
    click_button "Edit Bar"

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end

  scenario "user edits another user's bar" do
    click_button "Sign out"
    click_button "Sign in"
    fill_in "Email", with: user2.email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Happy Hour Lasagna"
    click_button "Edit Bar"

    expect(page).to have_content(bar1.name)
    expect(page).to have_content("You do not have permission to make this change")
  end
end
