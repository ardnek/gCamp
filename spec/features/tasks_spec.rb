require 'rails_helper'

feature "Tasks" do
  before do
    Project.create!(
    name: "Feed Buddy",
    )
    User.create!(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "password",
    password_confirmation: "password"
    )
  end

  scenario "User creates, edits, deletes task" do
    visit projects_path
    click_on "Feed Buddy"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Description", with: "Buy dog food"
    fill_in "Date", with: "12/29/2014"
    click_button "Create Task"
    expect(page).to have_content("Buy dog food")
    expect(page).to have_content("Task was successfully created.")

    click_on "Buy dog food"
    click_on "Edit"
    fill_in "Description", with: "dog food"
    click_button "Update Task"
    expect(page).to have_content("dog food")
    expect(page).to have_content("Task was successfully updated.")

    first('.glyphicon-remove').click
    expect(page).to have_content("Task was successfully destroyed.")
    # within('table.table tr', text: "Some name") do
    # find(".glyphicon").click
  end

  scenario "User must enter description of a task" do
    visit projects_path
    click_on "Feed Buddy"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Description", with: ""
    fill_in "Date", with: "12/29/2014"
    click_on "Create Task"
    expect(page).to have_content("Description can't be blank")
  end

end
