require "test_helper"

class DisciplinaTest < ActiveSupport::TestCase
  test 'Disciplina criada corretamente' do
    turma = Turma.new letra: 'A', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'marcos', password: '123456', password_confirmation: '123456'
    user.save

    disciplina = Disciplina.new nome: 'Inglês', anoLetivo: '2020', turma_id: turma.id, user_id: user.id
    assert disciplina.save
  end

  test 'disciplina com nome vazio' do
    turma = Turma.new letra: 'C', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'joaquim', password: '123456', password_confirmation: '123456'
    user.save

    disciplina = Disciplina.new nome: "", anoLetivo: '2020', turma_id: turma.id, user_id: user.id
    assert_not disciplina.save
  end

  test 'disciplina com ano letivo menor que o especificado' do
    turma = Turma.new letra: 'C', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'joaquim', password: '123456', password_confirmation: '123456'
    user.save

    disciplina = Disciplina.new nome: "Matemática", anoLetivo: '2009', turma_id: turma.id, user_id: user.id
    assert_not disciplina.save
  end
end
