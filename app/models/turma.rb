class Turma < ApplicationRecord
  validates :letra, presence: true
  validates :anoLetivo, presence: true
  validates :ano, presence: true
end
