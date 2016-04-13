require "rails_helper"

feature "user deletes a review" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: "janedoe@gmail.com") }
  let!(:bar) { FactoryGirl.create(:bar, user: user1) }
  let!(:review1) { FactoryGirl.create(:review, user: user1, bar: bar) }
  let(:review2) do
    FactoryGirl.create(:review,
    user: user1, bar: bar,
    title: "Worst bar ever.",
    body: "My freinds and I had a horible time here.",
    rating: 1)
  end

  scenario "user attempts to edit another user's review" do
    visit bars_path
    page.find('.dropbtn').click
    click_link "Sign in"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    click_link bar.name
    click_button "Edit"

    expect(page).to have_content bar.name
    expect(page).to have_content("You do not have permission to make this change")
  end

  scenario "authenticated user successfully deletes a review" do
    visit bars_path
    page.find('.dropbtn').click
    click_link "Sign in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"
    click_link bar.name
    click_button "Delete"

    expect(page).to have_content("Review has been deleted")
    expect(page).not_to have_content review1.title
    expect(page).not_to have_content review1.body
    expect(page).not_to have_content review1.rating
    expect(page).not_to have_content review2.title
    expect(page).not_to have_content review2.body
    expect(page).not_to have_content review2.rating
  end
end
