class User < ActiveRecord::Base

  has_many :memberships
  has_many :projects, through: :memberships

  def full_name
    [first_name, last_name].join(' ')
  end

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password

end
