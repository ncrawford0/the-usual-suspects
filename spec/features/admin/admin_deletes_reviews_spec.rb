require "rails_helper"

feature "admin deletes a bar" do
  let!(:new_admin) { Admin.create(email: "abcd@gmail.com", password: "12345678") }
  let!(:user1) { User.create(email: "abcd1@gmail.com", password: "12345678") }
  let!(:new_bar) { Bar.create(name: "underbar", description: "in the middle of downtown", user_id: user1.id) }
  let!(:new_review) { Review.create(title: "awesome!", body: "this place is the best!", rating: 5, bar_id: new_bar.id) }

  scenario "admin signs in and deletes bar" do
    visit "/admins/sign_in"
    fill_in "Email", with: "abcd@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Admin Dashboard"
    click_button "Delete underbar"

    expect(page).to have_content("underbar has been deleted")
  end
end
