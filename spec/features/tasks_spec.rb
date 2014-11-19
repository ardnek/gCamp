require 'rails_helper'

feature "Tasks" do

  scenario "User creates, edits, deletes task" do
    visit root_path
    click_on "Projects"
    click_on "Create Project"

    project1 = Project.create!(
    name: "sailing trip"
    )

    click_on "Create project"
    expect(page).to have_content("sailing trip")

    visit project_tasks_path(project1)
    click_on "Create Task"

    Task.create!(
    description: "buy boat",
    date: "Date.today",
    )
    click_on "Create Task"

    expect(page).to have_content("Task was successfully created")

    visit project_tasks_path(project1)

    click_on "Edit"
    fill_in "Description", with: "sailing trip to Bermuda"
    click_on "Update Task"
    expect(page).to have_content("Task was successfully updated.")
    expect(page).to have_content("sailing trip to Bermuda")

    click_on "Back"
    click_on "Destroy"
    expect(page).to have_content("Task was successfully destroyed.")
    expect(page).to have_no_content("sailing trip to Bermuda")

  end

end
