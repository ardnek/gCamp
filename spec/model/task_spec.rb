
require 'rails_helper'

describe Task do

    it "fails past task dates" do
      task = Task.new
      task.date = "11/10/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(true)
    end

    it "success on future dates" do
      task = Task.new
      task.date = "12/12/2017"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
    end

    it "success on current date" do
      task = Task.new
      task.date = "11/12/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
    end

    it "success editing date on existing task" do
      task = Task.create!(description: "carve pumpkins", date: "11/12/2014")
      task.date = "10/12/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
    end

    #it "editing a past task"
    #back in time
    #end
  

end
