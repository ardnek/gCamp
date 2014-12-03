require 'rails_helper'

describe User do

  it "validates the invalid presence of users email" do
    user = User.new
    expect(user.valid?).to be(false)
    #expect(user.errors[:email].present?).to eq(true)
  end

  it "validates the valid presence of users email" do
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
end
