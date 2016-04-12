require "rails_helper"

feature "non-user views a list of bars" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }
  scenario "sees all bars" do
    visit bars_path

    expect(page).to have_content("All Bars")
    expect(page).to have_content(bar.name)
  end
end
