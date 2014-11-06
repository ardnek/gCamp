require 'rails_helper'

feature "Events" do

  scenario "User manages events" do
    visit root_path
    click_on "New Event"
    fill_in "Description", with: "My stellar event"

    click_on "Create Event"
    visit root_path
    expect(page).to have_content("My stellar event")

    click_on "My stellar event"
    click_on "Edit"
    fill_in "Description", with: "My totally stellar event"
    click_on "Update Event"

    expect(page).to have_content("My totally stellar event")
    expect(page).to have_no_content("My stellar event")

    click_on "delete"
    expect(page).to have_no_content("My totally stellar event")

end

end
