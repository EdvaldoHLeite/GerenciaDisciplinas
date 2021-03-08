class Aluno < ApplicationRecord
  belongs_to :turma
  has_many :avaliacaos, dependent: :destroy

  validates :nome, presence: true, length: {minimum: 5, maximum: 20, message: "Tamanho do nome de 5-20 caracteres"}
  validates :turma_id, presence: true
end
