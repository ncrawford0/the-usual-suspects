require "rails_helper"

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
    # expect(page).to have_xpath('//img[@src="/public/images/avatar.png"]')
    # page.find('avatar')['src'].should have_content 'avatar.png'
    expect(page).to have_css('.avatar')
  end
end
