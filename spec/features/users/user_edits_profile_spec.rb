require "rails_helper"

feature "user updates their user details" do
  let!(:user1) { FactoryGirl.create(:user) }


  scenario "successfully updates log-in information" do
    visit user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"
    page.find(".dropbtn").click
    click_link "Edit profile"
    fill_in "Email", with: "janisdoe@gmail.com"
    fill_in "Password", with: "87654321"
    fill_in "Password confirmation", with: "87654321"
    fill_in "Current password", with: user1.password
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "submits form with email and current password blank" do
    visit user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"
    page.find(".dropbtn").click
    click_link "Edit profile"
    fill_in "Email", with: ""
    fill_in "Current password", with: ""

    click_button "Update"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Current password can't be blank")
  end
end
