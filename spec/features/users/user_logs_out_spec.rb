require "rails_helper"

feature "user logs out of page" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "successfully logs out" do

    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_button "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end
