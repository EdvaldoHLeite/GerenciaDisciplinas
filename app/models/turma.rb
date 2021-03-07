class Turma < ApplicationRecord
  validates :letra,
            presence: true,
            format: { with: /\A[a-zA-Z]+\z/, message: "Somente uma letra"},
            length: 1
  validates :anoLetivo,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2020,
              message: "Ano letivo a partir de 2020"
            }
  validates :ano,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 9,
              message: "Ano (serie) de 1º a 9º"
            }
end
