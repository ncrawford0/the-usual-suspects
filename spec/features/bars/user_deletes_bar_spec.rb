require "rails_helper"

feature "user deletes an existing bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }

  scenario "authenticated user successfully deletes bar" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_link bar.name
    click_button "Edit Bar"
    click_button "Delete Bar"

    expect(page).to have_content("has been deleted.")
  end

  scenario "unauthenticated user deletes bar" do
    visit bars_path
    click_link bar.name

    expect(page).to have_no_content("Edit Bar")
  end
end
