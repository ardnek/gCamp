require 'rails_helper'

# also has object_creation_method.

feature "Memberships" do

  xscenario "User adds a member to a project" do

    project = create_project(name: "Acme")
    create_user(first_name: "Ed", last_name: "Smith")

    visit project_path(project)
    click_on "0 Members"

  within(".memberships") do
    expect(page).to have_no_content("Ed Smith")
    expect(page).to have_no_content("Member")
  end

    select "Ed Smith", from: "membership_user_id"
    click_on "Add New Member"

  expect(page).to have_content("Ed Smith was added successfully")
  within(".memberships") do
    expect(page).to have_content("Ed Smith")
    expect(page).to have_content("Member")
  end

end
end
