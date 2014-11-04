class User < ActiveRecord::Base
  def full_name
    [first_name, last_name].join(' ')
  end

  validates :email, presence: true, uniqueness: true
  has_secure_password

end
