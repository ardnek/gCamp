require 'rails_helper'

feature "Signin" do

  # scenario "authentication" do
  # sign up w/errors
  # sign up w/success
  # sign out
  # sign in w/errors
  # sign in successfully
  # user attempts to register with invalid info
  # user registers with valid info
  # expect(page.current_path).to eq(tasks_path URL)
  # expect(page).to have_content("Invalid email / password combination")

  # before do = create_user
  #  User.create!(name: "First name")
  #  visit signin_path
  #  fill_in :password, with "email"
  #  click_on "Sign in"
  # end

  scenario "User signin successfully" do
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

    click_on "Sign Out"

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "bob@barker.com"
    fill_in "Password", with: "bob"

    click_on "Sign in"
    visit root_path
    expect(page).to have_content("Bob Barker")

    visit root_path
    click_on "Sign Out"
    expect(page).to have_no_content("Bob Barker")

end

  scenario "User signin unsuccessfully" do
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

    click_on "Sign Out"

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "bob@barker.com"
    fill_in "Password", with: "barker"
    expect(page).to have_no_content("Sign Out")

    end

end
