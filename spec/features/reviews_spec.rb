require "rails_helper"
require "pry"
​
  feature "Create A Review" do
    scenario "logged in user successfully creates a new review" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
    ​
      visit user_session_path
    ​
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
    ​
      click_button "Log in"
    ​
      click_button "Add New Bar"
    ​
      fill_in 'Name', with: 'Beantown Pub'
      fill_in 'Description', with: 'After hours cocktail bar with pool.'
    ​
      click_button "Add Bar"

      click_button "Add Review"
      fill_in 'title', with: "Best bar I've been to"
      fill_in 'body', with: "We were visiting and had a good time"
      fill_in 'rating', with: 5
      click_button "Create My Review"
      expect(page).to have_content("You've succesfully added a review")
      expect(page).to have_content("Best bar I've been to")

    end

      scenario "non-logged in user cannot create a new review" do

      bar = Bar.new(name: 'A', :description: 'B')

      visit bars_path
      click_link 'A'
      click_button 'Add Review'
      expect(page).to have_content('You must sign in first')
      expect(page).to have_content('Login')
      expect(page).to have_content('Email')
    end
  end

  feature "Edit Reviews" do



    scenario "logged in user can edit own review" do

      new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_button "Add New Bar"
      fill_in 'Name', with: 'Beantown Pub'
      fill_in 'Description', with: 'After hours cocktail bar with pool.'
      click_button "Add Bar"
      click_button "Add Review"
      fill_in 'title', with: "Best bar I've been to"
      fill_in 'body', with: "We were visiting and had a good time"
      fill_in 'rating', with: 5
      click_button "Create My Review"
      click_button "Edit my review"
      fill_in 'title', with: "This is the second best bar I've been to"
      click_button "Save"
      expect(page).to have_content("This is the second best bar I've been to")

    end

    scenario "logged in user cannot edit another users review" do

    new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")
    new_user2 = User.create(email: "xnick421@gmail.com", password: "12345678")
    scenario "can delete review" do
      visit user_session_path
      fill_in 'Email', with: new_user.email
      fill_in 'Password', with: new_user.password
      click_button "Log in"
      click_button "Add New Bar"
      fill_in 'Name', with: 'Beantown Pub'
      fill_in 'Description', with: 'After hours cocktail bar with pool.'
      click_button "Add Bar"
      click_button "Add Review"
      fill_in 'title', with: "Best bar I've been to"
      fill_in 'body', with: "We were visiting and had a good time"
      fill_in 'rating', with: 5
      click_button "Create My Review"
      click_button "Sign Out"
      visit user_session_path
      fill_in 'Email', with: new_user2.email
      fill_in 'Password', with: new_user2.password
      click_button "Log in"
      click_link "Beantown Pub"
      click_button "Edit Review"
      expect(page).to have_content('cannot edit this review')
    end

    scenario "logged out user cannot delete a users review" do


    new_user = User.create(email: "mckelvey.matt@gmail.com", password: "12345678")

      visit user_session_path
      fill_in 'Email', with: 'mckelvey.matt@gmail.com'
      fill_in 'Password', with: '12345678'
      click_button "Log in"
      click_button "Add New Bar"
      fill_in 'Name', with: 'Beantown Pub'
      fill_in 'Description', with: 'After hours cocktail bar with pool.'
      click_button "Add Bar"
      click_button "Add Review"
      fill_in 'title', with: "Best bar I've been to"
      fill_in 'body', with: "We were visiting and had a good time"
      fill_in 'rating', with: 5
      click_button "Create My Review"
      click_button "Sign out"
      click_button "Delete my review"
      expect(page).to has_content("The Review Was Unable To Be Removed")
    end

end
