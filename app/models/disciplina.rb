class Disciplina < ApplicationRecord
  belongs_to :turma
  belongs_to :user
end
