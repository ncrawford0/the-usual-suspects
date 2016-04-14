require "rails_helper"

feature "user adds a bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }


  before(:each) do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "authenticated user successfully creates a new bar without website" do
    click_button "Add New Bar"
    fill_in "Name", with: bar.name
    fill_in "Description", with: bar.description
    fill_in "Street", with: bar.street
    fill_in "City", with: bar.city
    fill_in "State", with: bar.state
    fill_in "Zip", with: bar.zip
    fill_in "Phone", with: bar.phone
    click_button "Add Bar"

    expect(page).to have_content(bar.description)
    expect(page).to have_content(bar.street)
    expect(page).to have_content(bar.city)
    expect(page).to have_content(bar.state)
    expect(page).to have_content(bar.zip)
    expect(page).to have_content(bar.phone)
  end

  scenario "authenticated user successfully creates a new bar with website" do
    click_button "Add New Bar"
    fill_in "Name", with: bar.name
    fill_in "Description", with: bar.description
    fill_in "Street", with: bar.street
    fill_in "City", with: bar.city
    fill_in "State", with: bar.state
    fill_in "Zip", with: bar.zip
    fill_in "Phone", with: bar.phone
    fill_in "Website", with: bar.website
    click_button "Add Bar"

    expect(page).to have_content(bar.description)
    expect(page).to have_content(bar.street)
    expect(page).to have_content(bar.city)
    expect(page).to have_content(bar.state)
    expect(page).to have_content(bar.zip)
    expect(page).to have_content(bar.phone)
    expect(page).to have_content(bar.website)
  end

  scenario "authenticated user submits form without a name or description" do
    click_button "Add New Bar"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Add Bar"

    expect(page).to have_content("Add Bar")
    expect(page).to have_content("Name can't be blank. Description can't be blank")
  end

  scenario "authenticated user submits form without a street, city, state, zip, or phone" do
    click_button "Add New Bar"
    fill_in "Name", with: bar.name
    fill_in "Description", with: bar.description
    fill_in "Street", with: ""
    fill_in "City", with: ""
    fill_in "State", with: ""
    fill_in "Zip", with: ""
    fill_in "Phone", with: ""
    click_button "Add Bar"

    expect(page).to have_content("Add Bar")
    expect(page).to have_content("Street can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip can't be blank")
    expect(page).to have_content("Phone can't be blank")
  end

  scenario "authenticated user submits form with invalid state" do
    click_button "Add New Bar"
    fill_in "Name", with: bar.name
    fill_in "Description", with: bar.description
    fill_in "Street", with: bar.street
    fill_in "City", with: bar.city
    fill_in "State", with: "XYZ"
    fill_in "Zip", with: bar.zip
    fill_in "Phone", with: bar.phone
    click_button "Add Bar"

    expect(page).to have_content("Add Bar")
    expect(page).to have_content("State is the wrong length (should be 2 characters)")
  end

  scenario "authenticated user submits form with invalid phone number" do
    click_button "Add New Bar"
    fill_in "Name", with: bar.name
    fill_in "Description", with: bar.description
    fill_in "Street", with: bar.street
    fill_in "City", with: bar.city
    fill_in "State", with: bar.state
    fill_in "Zip", with: bar.zip
    fill_in "Phone", with: "12345"
    click_button "Add Bar"

    expect(page).to have_content("Add Bar")
    expect(page).to have_content("Phone is the wrong length (should be 10 characters)")
  end

  scenario "unauthenticated user submits form" do
    page.find(".dropbtn").click
    click_link "Sign out"
    click_button "Add New Bar"

    expect(page).to have_content("Log in")
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
