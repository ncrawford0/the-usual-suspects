require "rails_helper"

feature "user adds a bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }
  let!(:bar2) { FactoryGirl.create(:bar, user: user) }
  let!(:bar3) { FactoryGirl.create(:bar, user: user) }
  let!(:bar4) { FactoryGirl.create(:bar, user: user) }
  let!(:bar5) { FactoryGirl.create(:bar, user: user) }
  let!(:bar6) { FactoryGirl.create(:bar, user: user) }

  before(:each) do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "user sees pagination of bar list" do

    expect(page).to have_selector('li', count: 5)
  end

  scenario "user sees second page of pagination" do
    click_link "2"

    within(:css, "li#bar-#{bar6.id}") do
      expect(page).to have_content(bar6.name)
    end
  end
end
