class User < ApplicationRecord
  has_secure_password
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true
end
