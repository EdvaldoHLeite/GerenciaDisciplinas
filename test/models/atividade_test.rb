require "test_helper"

class AtividadeTest < ActiveSupport::TestCase
  test 'criar atividade corretamente' do
    turma = Turma.new letra: 'A', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'marcos', password: '123456', password_confirmation: '123456'
    user.save
    disciplina = Disciplina.new nome: 'Inglês', anoLetivo: '2020', turma_id: turma.id, user_id: user.id
    disciplina.save

    atividade = Atividade.new titulo: 'escrita', descricao: "", bimestre: '3', data: '22/08/2020', disciplina_id: disciplina.id
    assert atividade.save
  end

  test 'atividade sem disciplina' do
    atividade = Atividade.new titulo: 'escrita', descricao: "opcional", bimestre: '3', data: '22/08/2020'
    assert_not atividade.save
  end

  test 'atividade com bimestre maior que 4' do
    turma = Turma.new letra: 'A', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'marcos', password: '123456', password_confirmation: '123456'
    user.save
    disciplina = Disciplina.new nome: 'Inglês', anoLetivo: '2020', turma_id: turma.id, user_id: user.id
    disciplina.save

    atividade = Atividade.new titulo: 'escrita', descricao: "opcional", bimestre: '6', data: '22/08/2020', disciplina_id: disciplina.id
    assert_not atividade.save
  end
end
