require "test_helper"

class AlunoTest < ActiveSupport::TestCase
  test 'criando aluno corretamente' do
    turma = Turma.new letra: 'A', anoLetivo: '2021', ano: '7'
    turma.save

    aluno = Aluno.new nome: "Pedro Santana", turma_id: turma.id
    assert aluno.save
  end

  test 'aluno com nome com menos de 5 caracteres' do
    turma = Turma.new letra: 'A', anoLetivo: '2021', ano: '7'
    turma.save

    aluno = Aluno.new nome: "PS", turma_id: turma.id
    assert_not aluno.save
  end

  test 'aluno sem turma' do
    turma = Turma.new letra: 'A', anoLetivo: '2021', ano: '7'
    turma.save

    aluno = Aluno.new nome: "Pedro Santana"
    assert_not aluno.save
  end
end
