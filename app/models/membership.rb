class Membership < ActiveRecord::Base

  validates :user, presence: :true

  belongs_to :project
  belongs_to :user
  # enum :role => [ :member, :owner]

end
