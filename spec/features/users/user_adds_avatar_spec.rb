require "rails_helper"
require "pry"


feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit new_user_registration_path
    fill_in "Email", with: "tommy.hui@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    attach_file :user_avatar, "#{Rails.root}/spec/support/images/avatar.jpg"
    click_button "Sign up"
    click_button "Edit profile"


    expect(page).to have_content("Edit User")
    image_file = page.find(".avatar")["src"]
    expect(image_file).to include "avatar.jpg"

  end
end
