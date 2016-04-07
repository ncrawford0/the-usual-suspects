require "rails_helper"

feature "authenticated user edits an existing bar" do
  let(:new_user) { User.create(email: "a3@gmail.com", password: "12345678") }
  let(:bar1) { Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?", user: new_user) }

  before(:each) do
    new_user
    bar1
    visit user_session_path
    fill_in "Email", with: "mckelvey.matt@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"
  end

  scenario "successfully edits a bar" do
    click_link "Happy Hour Lasagna"
    click_button "Edit bar"
    fill_in "Name", with: "This is the new bar"
    fill_in "Description", with: "The best place for a happy hour."
    click_button "Update bar"

    expect(page).to have_content("This is the new bar")
  end

  scenario "submits form without a name or description" do
    click_link "Happy Hour Lasagna"
    click_button "Edit bar"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Update bar"

    expect(page).to have_content("Edit Bar")
    expect(page).to have_content("Name can't be blank. Description can't be blank")
  end
end
