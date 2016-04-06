require "rails_helper"

feature "new user creates an account" do
  scenario "successfully creates an account" do
    visit new_user_registration_path
    fill_in "Email", with: "tommy.hui@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully")
  end

  scenario "submits form with email and password blank" do
    visit new_user_registration_path
    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "submits form with non-matching password and password confirmation" do
    visit new_user_registration_path
    fill_in "Email", with: "tommy.hui@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "92345678"
    click_button "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "submits form with too short password" do
    visit new_user_registration_path
    fill_in "Email", with: "tommy.hui@gmail.com"
    fill_in "Password", with: "1234567"
    fill_in "Password confirmation", with: "9234567"
    click_button "Sign up"

    expect(page).to have_content("Password is too short (minimum is 8 characters)")
  end
end
