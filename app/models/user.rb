class User < ApplicationRecord
  has_secure_password
  validates :login, presence: true, uniqueness: true, length: {minimum: 5, maximum: 20}
  validates :password, presence: true, length: {minimum: 6, maximum: 15}
end
