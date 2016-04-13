require "rails_helper"

feature "admin upgrades a user" do
  let!(:new_admin) { Admin.create(email: "abcd@gmail.com", password: "12345678") }
  let!(:user1) { User.create(email: "abcd1@gmail.com", password: "12345678") }

  scenario 'user is successfully upgraded' do
    visit '/admins/sign_in'
    fill_in "Email", with: "abcd@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    click_link "Admin Dashboard"
    click_link "Edit Users"
    find("#id-#{user1.id}").click_link "Make Admin"
    expect(page).to have_content(user1.email)


  end
  end
