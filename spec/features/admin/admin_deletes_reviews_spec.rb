require "rails_helper"

feature "admin deletes a bar" do
    let!(:admin) { Admin.create(email: "abcd@gmail.com", password: "12345678") }
    let!(:user) { FactoryGirl.create(:user) }
    let!(:bar) { FactoryGirl.create(:bar, user: user) }
    let!(:review) { FactoryGirl.create(:review) }

  scenario "admin signs in and deletes bar" do
    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    click_link "Admin Dashboard"
    click_button "Delete #{review.title}"

    expect(page).to have_content("has been deleted")
  end
end
