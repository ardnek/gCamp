class Membership < ActiveRecord::Base

  validates :user, presence: :true, uniqueness: {scope: :project, message: "has already been added"}
  validates :role, presence: true

  belongs_to :project
  belongs_to :user
  # enum :role => [ :member, :owner]

end
