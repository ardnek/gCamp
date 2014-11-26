class Task < ActiveRecord::Base

  belongs_to :project
  has_many :comments

  validate :check_the_date, on: :create
  validates :description, presence: true

  def check_the_date

    if date.present? && date < Date.today
      errors.add(:date, "can only be today or later.")
    end
  end
end
