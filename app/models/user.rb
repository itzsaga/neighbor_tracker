class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true

  has_many :houses
end
