require "rails_helper"

feature "non-user views a list of bars" do
  scenario "sees all bars" do
    new_bar = Bar.create(name: "Beantown Pub", description: "Cool bar, guy.")

    visit bars_path

    expect(page).to have_content("All Bars")
    expect(page).to have_content(new_bar.name)
  end
end
