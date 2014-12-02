require 'rails_helper'

feature "Projects" do

  scenario "User creates, edits, deletes project" do
    visit root_path
    click_on "Projects"

    click_on "Create Project"
    fill_in "Name", with: "Screenprint tshirts"

    click_on "Create project"
    expect(page).to have_content("Project was successfully created")
    expect(page).to have_content("Screenprint tshirts")

    click_on "Screenprint tshirts"
    click_on "edit"
    fill_in "Name", with: "Screenprinting tshirts"
    click_on "Edit Project"
    expect(page).to have_content("Screenprinting tshirts")
    expect(page).to have_no_content("Screenprint tshirts")

    click_on "delete"
    expect(page).to have_content("Project was successfully deleted")
    expect(page).to have_no_content("Screenprinting")

  end

end
