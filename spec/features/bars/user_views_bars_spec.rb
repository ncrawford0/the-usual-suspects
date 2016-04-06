require "rails_helper"

feature "authenticated user views a list of bars" do
  scenario "sees all bars" do

    new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
    new_bar = Bar.create(name: "Beantown Pub", description: "Cool bar, guy.")

    visit user_session_path
    fill_in 'Email', with: 'mckelvey.matt@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button "Log in"

    expect(page).to have_content("All Bars")
    expect(page).to have_content("Beantown Pub")
  end
end
