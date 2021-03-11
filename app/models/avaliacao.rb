class Avaliacao < ApplicationRecord
  belongs_to :atividade
  belongs_to :aluno

  validates :pontos,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 10,
              message: "Pontuação de 0 até 10" }
  validates :observacoes,
            length: {
              minimum: 0,
              maximum: 100,
              message: "Observações com no máximo 100 caracteres"}
  validates :atividade_id, presence: true
  validates :aluno_id, presence: true

  def user_id
    @user_id = atividade.user_id
  end
end
