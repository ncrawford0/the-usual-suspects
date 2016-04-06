require "rails_helper"

feature "user logs out of page" do
  scenario "successfully logs out" do

    new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

    visit user_session_path
    fill_in 'Email', with: 'mckelvey.matt@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button "Log in"
    click_button "Sign out"

    expect(page).to have_content('Signed out successfully.')
  end
end
