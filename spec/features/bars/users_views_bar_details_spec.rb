require "rails_helper"

feature "non-user views a bar's details" do
  let!(:user1) { User.create(email: "abcd4@gmail.com", password: "12345678") }
  let!(:bar1) { Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?", user: user1) }

  scenario "sees all details" do
    visit bars_path
    click_link "Happy Hour Lasagna"

    expect(page).to have_content(bar1.name)
    expect(page).to have_content(bar1.description)
  end
end
