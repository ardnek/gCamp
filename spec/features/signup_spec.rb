require 'rails_helper'

feature "Signup" do

  scenario "User signup" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Bob"
    fill_in "Last name", with: "Barker"
    fill_in "Email", with: "bob@barker.com"
    fill_in "Password", with: "bob"
    fill_in "Password confirmation", with: "bob"

    click_on "Sign up"
    visit root_path
    expect(page).to have_content("Bob Barker")

end

end
