require "rails_helper"

feature "authenticated user views a bar's details" do
  scenario "sees all details" do

    new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

    visit user_session_path
    fill_in 'Email', with: 'mckelvey.matt@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button "Log in"
    click_button "Add New Bar"
    fill_in 'Name', with: 'Beantown Pub'
    fill_in 'Description', with: 'After hours cocktail bar with pool.'
    click_button "Add Bar"

    expect(page).to have_content("Beantown Pub")
    expect(page).to have_content("After hours cocktail bar with pool.")
  end
end
