class User < Activerecord::Base
  has_secure_password
  validates :email, :presence => true
  has_many :tasks
end
