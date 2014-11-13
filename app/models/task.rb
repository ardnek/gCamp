class Task < ActiveRecord::Base

  validate :check_the_date, on: :create


  def check_the_date

    if date < Date.today
      errors.add(:date, "Can only be today or later.")
    end
  end
end
