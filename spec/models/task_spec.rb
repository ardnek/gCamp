require 'rails_helper'

describe Task do

  it "verifies entry of all fields" do
    task = Task.new
    expect(task.valid?).to be(false)
    task.description = "Carve pumpkins"
    expect(task.valid?).to be(true)
    task.date = '12/12/2090'
    expect(task.valid?).to be(true)
  end

  it "verifies can't have old date when creating" do
    task = Task.new
    task.description = "Make pie"
    task.date = Date.today-2
    expect(task.valid?).to be(false)
    expect(task.errors[:date].present?).to eq(true)
  end

  it "verifies can have future date when creating" do
    task = Task.new
    task.description = "Buy yarn"
    task.date = Date.today+2
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

  it "verifies can have old date when updating" do
    task = Task.create!(description: "Knit sweater")
    task.date = Date.today-2
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

  it "verifies can have future date when updating" do
    task = Task.create!(description: "Knit sweater")
    task.date = Date.today+2
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

  it "verifies can have today's date when updating" do
    task = Task.create!(description: "Knit sweater")
    task.date = Date.today
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

end
