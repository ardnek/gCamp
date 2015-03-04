require 'rails_helper'

feature "Users" do

  xscenario "User creates, edits, deletes user" do
    visit users_path
    click_on "Create user"
    fill_in "First name", with: "Lois"
    fill_in "Last name", with: "Lane"
    fill_in "Email", with: "lois@lane.com"
    fill_in "Password", with: "lois"
    fill_in "Password confirmation", with: "lois"

    click_on "Create User"
    expect(page).to have_content("User was successfully created.")
    expect(page).to have_content("Lois Lane")

    click_on "Lois Lane"
    click_on "Edit"
    fill_in "Last name", with: "Lannne"
    click_on "Update User"
    expect(page).to have_content("User was successfully updated.")
    expect(page).to have_content("Lois Lannne")
    expect(page).to have_no_content("Lois Lane")

    click_on "Lois Lannne"
    click_on "Edit"
    click_on "Delete user"
    expect(page).to have_content("User was successfully deleted.")
    expect(page).to have_no_content("Lois Lannne")
  end

end
