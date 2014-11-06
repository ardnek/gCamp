require 'rails_helper'

feature "Users" do

  scenario "User creates user" do
    visit users_path
    click_on "Create user"
    fill_in "First name", with: "Lois"
    fill_in "Last name", with: "Lane"
    fill_in "Email", with: "lois@lane.com"
    fill_in "Password", with: "lois"
    fill_in "Password confirmation", with: "lois"

    click_on "Create user"
    visit users_path
    expect(page).to have_content("Lois Lane")

    click_on "Lois Lane"
    click_on "Edit"
    fill_in "Last name", with: "Lannne"
    click_on "Update user"
    expect(page).to have_content("Lois Lannne")
    expect(page).to have_no_content("Lois Lane")

    click_on "Lois Lannne"
    click_on "Edit"
    click_on "Delete user"
    expect(page).to have_no_content("Lois Lannne")

end

end
