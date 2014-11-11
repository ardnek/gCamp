require 'rails_helper'

feature "Tasks" do

  scenario "User creates, edits, deletes task" do
    visit root_path
    click_on "Tasks"

    click_on "Create Task"
    fill_in "Description", with: "Air hockey"
    fill_in "Date", with: "12/12/2014"

    click_on "Create"
    expect(page).to have_content("Task was successfully created.")

    click_on "Edit"
    fill_in "Description", with: "Skydiving"
    click_on "Update Task"
    expect(page).to have_content("Task was successfully updated.")

    click_on "Back"
    click_on "Destroy"
    expect(page).to have_content("Task was successfully destroyed.")

  end

end
