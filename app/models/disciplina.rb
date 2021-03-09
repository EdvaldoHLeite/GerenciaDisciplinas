class Disciplina < ApplicationRecord
  belongs_to :turma
  belongs_to :user
  has_many :atividades, dependent: :destroy

  validates :nome,
            presence: true,
            length: {
              minimum: 4,
              maximum: 20,
              message: "Tamanho do nome de 4-20 caracteres"}
  validates :anoLetivo,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2020,
              message: "Ano letivo a partir de 2020" }
  validates :turma_id, presence: true
  validates :user_id, presence: true
end
