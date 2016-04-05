require "rails_helper"
require "pry"


feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit "/users/sign_up"

    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password confirmation", with: "boomstick!3vilisd3ad"
    attach_file :user_avatar, "#{Rails.root}/spec/support/images/avatar.jpg"
    click_button "Sign up"
    visit "/users/edit"

    expect(page).to have_content("Edit User")
    image_file = page.find('.avatar')['src']
    expect(image_file).to include ('avatar.jpg')
    
  end
end
