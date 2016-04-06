require "rails_helper"

feature "user deletes account" do
  scenario "successfully deletes account" do

    new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

    visit user_session_path
    fill_in 'Email', with: 'mckelvey.matt@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button "Log in"
    click_button "Edit profile"
    click_button "Cancel my account"

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end
end
