require "rails_helper"
# BAR USER STORIES
#
#   As an authenticated user
#   I want to add a bar
#   So that others can review it

# describe "user adds bar" do

  # before(:each) do
  #   new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
  #
  #   visit user_session_path
  #
  #   fill_in 'Email', with: 'mckelvey.matt@gmail.com'
  #   fill_in 'Password', with: '12345678'
  #
  #   click_button "Log in"
  #   end

  feature "authenticated user adds a bar" do
    scenario "successfully creates a new bar" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_button "Add New Bar"
      fill_in 'Name', with: 'Beantown Pub'
      fill_in 'Description', with: 'After hours cocktail bar with pool.'
      click_button "Add Bar"

      expect(page).to have_content('Beantown Pub')
    end

    scenario "submits form without a name or description" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_button "Add New Bar"
      fill_in 'Name', with: ''
      fill_in 'Description', with: ''
      click_button "Add Bar"

      expect(page).to have_content("Add Bar")
      expect(page).to have_content("Name can't be blank. Description can't be blank")
    end
  end

#   As an authenticated user
#   I want to view a list of bars
#   So that I can pick bars to review

  feature "authenticated user views a list of bars" do
    scenario "sees all bars" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
      new_bar = Bar.create(name: "Beantown Pub", description: "Cool bar, guy.")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"

      expect(page).to have_content("All Bars")
      expect(page).to have_content("Beantown Pub")
    end
  end
#
#   As an authenticated user
#   I want to view the details about a bar
#   So that I can get more information about the bar

  feature "authenticated user views a bar's details" do
    scenario "sees all details" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_button "Add New Bar"
      fill_in 'Name', with: 'Beantown Pub'
      fill_in 'Description', with: 'After hours cocktail bar with pool.'
      click_button "Add Bar"

      expect(page).to have_content("Beantown Pub")
      expect(page).to have_content("After hours cocktail bar with pool.")
    end
  end

#   As an authenticated user
#   I want to update a bar's information that I created
#   So that I can correct errors or provide new information about the bar

  feature "authenticated user edits an existing bar" do
    scenario "successfully edits a bar" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
      bar_1 = Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_link "Happy Hour Lasagna"
      click_button "Edit bar"
      fill_in 'Name', with: 'This is the new bar'
      fill_in 'Description', with: 'The best place for a happy hour.'
      click_button "Update bar"

      expect(page).to have_content("This is the new bar")
    end

    scenario "submits form without a name or description" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
      bar_1 = Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_link "Happy Hour Lasagna"
      click_button "Edit bar"
      fill_in 'Name', with: ''
      fill_in 'Description', with: ''
      click_button "Update bar"

      expect(page).to have_content("Edit Bar")
      expect(page).to have_content("Name can't be blank. Description can't be blank")
    end
  end

#   As an authenticated user
#   I want to delete a bar I created
#   So that no one can review the bar

  feature "authenticated user deletes an existing bar" do
    scenario "successfully deletes bar" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
      bar_1 = Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_link "Happy Hour Lasagna"
      click_button "Delete bar"

      expect(page).to have_content("has been deleted.")

    end
  end
#
# end
