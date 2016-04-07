require "rails_helper"

feature "non-user views a bar's details" do
  let!(:bar1) { Bar.create(name: "Happy Hour Lasagna", description: "Where are we at?") }

  scenario "sees all details" do
    visit bars_path
    click_link "Happy Hour Lasagna"

    expect(page).to have_content(bar1.name)
    expect(page).to have_content(bar1.description)    
  end
end
