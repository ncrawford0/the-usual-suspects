require "rails_helper"

feature "non-user views a list of bars" do
  scenario "sees all bars" do
    user1 = User.create(email: "abcd3@gmail.com", password: "12345678")
    new_bar = Bar.create(name: "Beantown Pub", description: "Cool bar, guy.", user: user1)
    visit bars_path

    expect(page).to have_content("All Bars")
    expect(page).to have_content(new_bar.name)
  end
end
