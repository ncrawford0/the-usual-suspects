require "rails_helper"

feature "user deletes an existing bar" do
  let!(:user1) { User.create(email: "abcd1@gmail.com", password: "12345678") }
  let!(:bar1) { Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?", user: user1) }

  scenario "authenticated user successfully deletes bar" do
    visit user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Happy Hour Lasagna"
    click_button "Edit Bar"
    click_button "Delete Bar"

    expect(page).to have_content("has been deleted.")
  end

  scenario "unauthenticated user deletes bar" do
    visit bars_path
    click_link "Happy Hour Lasagna"
    click_button "Edit Bar"

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
