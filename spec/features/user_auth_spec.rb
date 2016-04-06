require "rails_helper"
# AUTHENTICATED USER STORIES
#
#   As a prospective user
#   I want to create an account
#   So that I can post items and review them

  feature "new user creates an account" do
    scenario "successfully creates an account" do

      visit new_user_registration_path
      fill_in 'Email', with: 'tommy.hui@gmail.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button "Sign up"

      expect(page).to have_content('Welcome! You have signed up successfully')
    end

    scenario "submits form with email and password blank" do

      visit new_user_registration_path
      click_button "Sign up"

      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('Password can\'t be blank')
    end

    scenario "submits form with non-matching password and password confirmation" do

      visit new_user_registration_path
      fill_in 'Email', with: 'tommy.hui@gmail.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '92345678'
      click_button "Sign up"

      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end

    scenario "submits form with too short password" do

      visit new_user_registration_path
      fill_in 'Email', with: 'tommy.hui@gmail.com'
      fill_in 'Password', with: '1234567'
      fill_in 'Password confirmation', with: '9234567'
      click_button "Sign up"

      expect(page).to have_content('Password is too short (minimum is 8 characters)')
    end
  end

#   As an unauthenticated user
#   I want to sign in
#   So that I can post items and review them

  feature "user logs into account" do
    scenario "successfully logs in" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"

      expect(page).to have_content('Signed in successfully')
    end

    scenario "submits form with incorrect password" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '99999999'
      click_button "Log in"

      expect(page).to have_content('Invalid email or password.')
    end
  end
#
#    As an authenticated user
#    I want to sign out
#    So that no one else can post items or reviews on my behalf
#
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
#
#    As an authenticated user
#    I want to update my information
#    So that I can keep my profile up to date
#
  feature "user updates their user details" do
    scenario "successfully updates log-in information" do

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

    scenario "submits form with email and current password blank" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_button "Edit profile"
      fill_in 'Email', with: ''
      fill_in 'Current password', with: ''

      click_button "Update"

      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('Current password can\'t be blank')
    end
  end
#
#    As an authenticated user
#    I want to delete my account
#    So that my information is no longer retained by the app
#
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
