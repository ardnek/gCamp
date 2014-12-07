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

  it "can't create a task with an old date" do
    task = Task.new
    task.description = "Make pie"
    task.date = Date.today-2
    expect(task.valid?).to be(false)
    expect(task.errors[:date].present?).to eq(true)
  end

  it "creates a task with future date" do
    task = Task.new(
    description: "Buy yarn",
    date: Time.now + 7.days
    )
    task.valid?
    expect(task.errors[:date].present?).to eq (false)
    # task = Task.new
    # task.description = "Buy yarn"
    # task.date = Date.today+2
    # expect(task.valid?).to be(true)
    # expect(task.errors[:date].present?).to eq(false)
  end

  it "edits a task with a future date" do
    task = Task.create!(description: "Knit sweater")
    task.date = Date.today+2
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

  it "edits a task with today's date" do
    task = Task.create!(description: "Knit sweater")
    task.date = Date.today
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

  it "edits a task with a past date" do
    task = Task.create!(description: "Knit sweater")
    task.date = Date.today-2
    expect(task.valid?).to be(true)
    expect(task.errors[:date].present?).to eq(false)
  end

  # it "Edits a task with a past date" do
  #   task = nil
  #
  #   travel_to 3.weeks.ago do
  #     task = Task.create!(
  #     description: "Test the app",
  #     due_date: Time.now
  #     )
  #   end
  #
  #   task.description = "Test the app again"
  #   task.valid?
  #   expect(task.errors[:due_date].present?).to eq(false)
  # end

end
