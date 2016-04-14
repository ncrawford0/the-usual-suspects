require "rails_helper"

feature "user upvotes a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, bar: bar) }
  let!(:review2) { FactoryGirl.create(:review, user: user, bar: bar) }
  let!(:user2) { FactoryGirl.create(:user, email: "janedoe@gmail.com") }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    click_link bar.name
  end

  scenario "authenticated user successfully upvotes a review" do
    within(:css, "li.upvote##{review.id}") do
      click_button "Upvote"
    end

    within(:css, "li.vote-total##{review.id}") do
      expect(page).to have_content("1")
    end
  end

  scenario "authenticated user cancels their upvote" do
    within(:css, "li.upvote##{review.id}") do
      click_button "Upvote"
    end

    within(:css, "li.upvote##{review.id}") do
      click_button "Upvote"
    end

    within(:css, "li.vote-total##{review.id}") do
      expect(page).to have_content("0")
    end
  end

  scenario "unauthenticated user attempts to upvote review" do
    page.find(".dropbtn").click
    click_link "Sign out"
    click_link bar.name

    within(:css, "li.upvote##{review.id}") do
      click_button "Upvote"
    end

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
