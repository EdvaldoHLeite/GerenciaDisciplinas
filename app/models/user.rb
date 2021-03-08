class User < ApplicationRecord
  has_secure_password
  has_many :disciplinas
  validates :login, presence: true, uniqueness: true, length: {minimum: 5, maximum: 20, message: "Login com tamanho de 5 a 20"}
  validates :password, presence: true, length: {minimum: 6, maximum: 15, message: "Senha com tamanho de 6 a 15"}
end
