require "rails_helper"

feature "non-user views a bar's details" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }

  scenario "sees all details" do
    visit bars_path
    click_link bar.name

    expect(page).to have_content(bar.name)
    expect(page).to have_content(bar.description)
  end
end
