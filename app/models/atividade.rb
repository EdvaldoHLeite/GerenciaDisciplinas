class Atividade < ApplicationRecord
  belongs_to :disciplina
  has_many :avaliacaos, dependent: :destroy

  validates :titulo, presence: true, length: {minimum: 5, maximum: 20, message: "Tamanho do titulo de 5-20 caracteres"}
  validates :descricao, length: {minimum: 0, maximum: 100, message: "Descrição com no máximo 100 caracteres"}
  validates :bimestre, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4, message: "Bimestre somente de 1 a 4" }
  validates :data, presence: true
  validates :disciplina_id, presence: true

  scope :by_bimestre, lambda { |bimestre| where(bimestre: bimestre) unless bimestre.nil? }

  def user_id
    @user_id = disciplina.user_id
  end

  def media
    avaliacoes = avaliacaos
    soma = 0
    quantidade = avaliacoes.count
    unless quantidade == 0
      avaliacoes.each do |avaliacao|
        soma += avaliacao.pontos
      end
    else
      quantidade = 1
    end
    return soma / quantidade
  end
end
