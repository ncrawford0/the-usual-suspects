require "rails_helper"

feature "user logs into account" do

  let(:new_user) { User.create(email: "mckelvey.matt@gmail.com", password: "12345678") }

  scenario "successfully logs in" do

    new_user
    visit user_session_path
    fill_in 'Email', with: 'mckelvey.matt@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button "Log in"

    expect(page).to have_content('Signed in successfully')
  end

  scenario "submits form with incorrect password" do

    new_user
    visit user_session_path
    fill_in 'Email', with: 'mckelvey.matt@gmail.com'
    fill_in 'Password', with: '99999999'
    click_button "Log in"

    expect(page).to have_content('Invalid email or password.')
  end
end
