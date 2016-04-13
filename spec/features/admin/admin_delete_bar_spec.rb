require "rails_helper"

feature "admin deletes a review" do
  let!(:new_admin) { Admin.create(email: "abcd@gmail.com", password: "12345678") }
  let!(:user1) { User.create(email: "abcd1@gmail.com", password: "12345678") }
  let!(:new_bar) { Bar.create(name: "underbar", description: "in the middle of downtown", user_id: user1.id) }
  let!(:new_review) { Review.create(title: 'good', body: "good", rating: 5, bar_id: new_bar.id, user_id: user1.id) }
scenario "admin signs in and deletes a review" do
    visit '/admins/sign_in'
    fill_in "Email", with: "abcd@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Admin Dashboard"


    click_button "Delete good"
    expect(page).to have_content("good has been deleted")
  end
end
