require 'rails_helper'

describe User do

  it "is invalid without a users email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
    expect(user.valid?).to be(false)
  end

  it "is valid with the presence of users email" do
    user = User.new
    user.email = "bill@murray.com"
    #user.valid?
    #expect(user.valid?).to be(true)
    expect(user.errors[:email].present?).to eq(false)
  end

  it "allows user for unique emails" do
    User.create!(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "bill",
    password_confirmation: "bill"
    )
    user = User.new(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@billmurray.com",
    password: "bill",
    password_confirmation: "bill"
    )
    #user.valid?
    expect(user.valid?).to be(true)
    expect(user.errors[:email].present?).to eq(false)

    user = User.new(
    first_name: "Billy",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "bill",
    password_confirmation: "bill"
    )
    #user.valid?
    expect(user.valid?).to be(false)
    expect(user.errors[:email].present?).to eq(true)
  end

  it "is invalid with a duplicate email address" do
    User.create!(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "bill",
    password_confirmation: "bill"
    )

    user = User.new(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "bill",
    password_confirmation: "bill"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end


  it "has unique email regardless of case sensitivity" do
    user = User.create!(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "bill",
    password_confirmation: "bill"
    )
    user.email = "BILL@MURRAY.com"
    #user.valid?
    expect(user.valid?).to be(true)
    expect(user.errors[:email].present?).to eq(false)
  end

  it "returns a users full name as a string" do
    user = User.new(
    first_name: "Bill",
    last_name: "Murray",
    email: "bill@murray.com",
    password: "bill",
    password_confirmation: "murray"
    )
    expect(user.full_name).to eq "Bill Murray"
  end

  it "does not allow duplicate email" do
    user1 = create_user
    user = User.new(email: user1.email )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

end
