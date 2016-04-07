require "rails_helper"

feature "authenticated user adds a bar" do
  let(:new_user) { User.create(email: "a@gmail.com", password: "12345678") }

  before(:each) do
    new_user
    visit user_session_path
    fill_in "Email", with: "mckelvey.matt@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
  end

  scenario "successfully creates a new bar" do
    click_button "Add New Bar"
    fill_in "Name", with: "Beantown Pub"
    fill_in "Description", with: "After hours cocktail bar with pool."
    click_button "Add Bar"

    expect(page).to have_content("Beantown Pub")
  end

  scenario "submits form without a name or description" do
    click_button "Add New Bar"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Add Bar"

    expect(page).to have_content("Add Bar")
    expect(page).to have_content("Name can't be blank. Description can't be blank")
  end
end
