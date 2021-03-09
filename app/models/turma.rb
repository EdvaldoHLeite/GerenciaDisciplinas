class Turma < ApplicationRecord
  has_many :disciplinas, dependent: :destroy
  has_many :turmas, dependent: :destroy
  validates :letra, presence: true, length: {is:1}, format: { with: /\A[a-zA-Z]+\z/, message: "Somente uma letra"}
  validates :anoLetivo, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2020, message: "Ano letivo a partir de 2020" }
  validates :ano, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9, message: "Ano (serie) de 1º a 9º" }
end
