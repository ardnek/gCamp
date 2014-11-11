require 'rails_helper'

feature "Projects" do

  scenario "User creates, edits, deletes project" do
    visit root_path
    click_on "Projects"

    click_on "Create Project"
    fill_in "Name", with: "Screenprint tshirts"

    click_on "Create project"
    expect(page).to have_content("Project was successfully created")

    click_on "Screenprint tshirts"
    click_on "edit"
    fill_in "Name", with: "Screenprinting"
    click_on "Edit Project"
    expect(page).to have_content("Screenprinting")

    click_on "delete"
    expect(page).to have_content("Project was successfully deleted")

  end

end
