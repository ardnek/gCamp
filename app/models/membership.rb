class Membership < ActiveRecord::Base

  validates :user_id, presence: true, uniqueness: {scope: :project_id, message: "has already been added"}
  validates :role, presence: true

  belongs_to :project
  belongs_to :user
  # enum :role => [ :member, :owner]

end
