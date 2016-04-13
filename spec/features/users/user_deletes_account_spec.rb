require "rails_helper"

feature "user deletes account" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "successfully deletes account" do

    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    page.find('.dropbtn').click
    click_link "Edit profile"
    click_button "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
