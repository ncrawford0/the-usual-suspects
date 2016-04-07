require "rails_helper"

feature "authenticated user deletes an existing bar" do
  scenario "successfully deletes bar" do
    user1 = User.create(email: "a2@gmail.com", password: "12345678")
    Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?", user: user1)

    visit user_session_path
    fill_in "Email", with: "mckelvey.matt@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Happy Hour Lasagna"
    click_button "Delete bar"

    expect(page).to have_content("has been deleted.")

  end
end
