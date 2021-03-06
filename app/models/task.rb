class Task < ActiveRecord::Base

  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :description, presence: true
  validate :check_the_date, on: :create

  def check_the_date
    if date.present? && date < Date.today
      errors.add(:date, "can only be today or later.")
    end
  end
end
