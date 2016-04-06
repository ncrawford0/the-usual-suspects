require "rails_helper"

feature "user updates their user details" do
  let!(:new_user) { User.create(email: "mckelvey.matt@gmail.com", password: "12345678") }

  scenario "successfully updates log-in information" do
    visit user_session_path
    fill_in "Email", with: "mckelvey.matt@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_button "Edit profile"
    fill_in "Email", with: "mckelvey.matt.linkedin@gmail.com"
    fill_in "Password", with: "23456789"
    fill_in "Password confirmation", with: "23456789"
    fill_in "Current password", with: "12345678"
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "submits form with email and current password blank" do
    visit user_session_path
    fill_in "Email", with: "mckelvey.matt@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_button "Edit profile"
    fill_in "Email", with: ""
    fill_in "Current password", with: ""

    click_button "Update"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Current password can't be blank")
  end
end
