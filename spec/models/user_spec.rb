require 'rails_helper'

describe User do

  it "validates the invalid presence of users email" do
    user = User.new
    user.valid?
    #expect(user.errors[:email].present?).to eq(true)
    #expect(user.valid?).to be(false)
    expect(user.errors[:email]).to be_present
  end

  it "validates the valid presence of users email" do
    user = User.new
    user.email = "bill@murray.com"
    user.valid?
    #expect(user.valid?).to be(true)
    expect(user.errors[:email].present?).to eq(false)
  end

  it "allows user for different emails" do
    User.create!(first_name: "Bill", last_name: "Murray", email: "bill@murray.com",
    password: "bill")
    user = User.new(first_name: "Bill", last_name: "Murray", email: "bill@billmurray.com",
    password: "bill")
    user.valid?
    #expect(user.valid?).to be(true)
    expect(user.errors[:email].present?).to eq(false)
  end

  it "rejects user for duplicate emails" do
    User.create!(first_name: "Bill", last_name: "Murray", email: "bill@murray.com",
    password: "bill")
    user = User.new(first_name: "Bill", last_name: "Murray", email: "bill@murray.com",
    password: "bill")
    user.valid?
    #expect(user.valid?).to be(false)
    expect(user.errors[:email].present?).to eq(true)
  end

  it "fails user regardless of email case sensitivity" do
    User.create!(first_name: "Bill", last_name: "Murray", email: "bill@murray.com",
    password: "bill")
    user = User.new(email: "BILL@MURRAY.com")
    user.valid?
    #expect(user.valid?).to be(false)
    expect(user.errors[:email].present?).to eq(true)
  end

end
