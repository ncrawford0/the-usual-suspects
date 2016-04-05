require "rails_helper"
# AUTHENTICATED USER STORIES
#
#   As a prospective user
#   I want to create an account
#   So that I can post items and review them

  feature "user creates an account" do
    scenario "fills in register form and clicks on register button on index page" do

      visit new_user_registration_path

      fill_in 'Email', with: 'tommy.hui@gmail.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button "Sign up"

      expect(page).to have_content('Welcome! You have signed up successfully')
    end
  end

#   As an unauthenticated user
#   I want to sign in
#   So that I can post items and review them

  feature "user logs into page" do
    scenario "fills in login info on index page and clicks login button" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path

      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'

      click_button "Log in"

      expect(page).to have_content('Signed in successfully')
    end
  end
#
#    As an authenticated user
#    I want to sign out
#    So that no one else can post items or reviews on my behalf
#
  feature "user logs out of page" do
    scenario "clicks logout button and logouts" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path

      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'

      click_button "Log in"

      click_button "Sign out"

      expect(page).to have_content('Signed out successfully.')
    end
  end
#
#    As an authenticated user
#    I want to update my information
#    So that I can keep my profile up to date
#
  feature "user updates their user details" do
    scenario "user logs in, clicks edit profile button, submits button and changes are made to their user profile" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path

      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'

      click_button "Log in"

      click_button "Edit profile"

      fill_in 'Email', with: 'mckelvey.matt.linkedin@gmail.com'
      fill_in 'Password', with: '23456789'
      fill_in 'Password confirmation', with: '23456789'
      fill_in 'Current password', with: '12345678'

      click_button "Update"

      expect(page).to have_content('Your account has been updated successfully.')
    end
  end
#
#    As an authenticated user
#    I want to delete my account
#    So that my information is no longer retained by the app
#
feature "deletes account" do
  scenario "user logs in, clicks edit profile button, submits cancel button and account is deleted" do

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
