
require 'rails_helper'

describe Task do
  include ActiveSupport::Testing::TimeHelpers

    it "fails past task dates" do
      task = Task.new

      task.date = "11/10/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(true)
    end


    describe SomeObject do
      skip
      it 'works with the new hotness' do
        the_thing = SomeObject.new
        travel_to(1.day.ago) do
          expect(the_thing.works_with_new_hotness?).to eq true
        end



    it "verifies success for future dates" do
      task = Task.new
      task.date = "12/12/2017"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
    end

    it "verifies success for current date" do
      task = Task.new
      task.date = "11/12/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
    end

    it "verifies success editing date for new and existing tasks" do
      task = Task.create!(description: "carve pumpkins", date: "11/12/2014")
      task.date = "10/12/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
      task.date = "12/11/2014"
      task.valid?
      expect(task.errors[:date].present?).to eq(false)
    end

    #it "success editing date for an existing past task" do
    #end
  end
end
