require "test_helper"

class AvaliacaoTest < ActiveSupport::TestCase
  test 'criando avaliacao corretamente' do
    # atividade
    turma = Turma.new letra: 'A', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'marcos', password: '123456', password_confirmation: '123456'
    user.save
    disciplina = Disciplina.new nome: 'Inglês', anoLetivo: '2020', turma_id: turma.id, user_id: user.id
    disciplina.save
    atividade = Atividade.new titulo: 'escrita', descricao: "", bimestre: '3', data: '22/08/2020', disciplina_id: disciplina.id
    atividade.save

    # aluno
    aluno = Aluno.new nome: "Pedro Santana", turma_id: turma.id
    aluno.save

    avaliacao = Avaliacao.new pontos: 4, observacoes: 'até amanhã', atividade_id: atividade.id, aluno_id: aluno.id
    assert avaliacao.save
  end

  test 'criando avaliacao sem aluno' do
    # atividade
    turma = Turma.new letra: 'A', anoLetivo: '2020', ano: '5'
    turma.save
    user = User.new login: 'marcos', password: '123456', password_confirmation: '123456'
    user.save
    disciplina = Disciplina.new nome: 'Inglês', anoLetivo: '2020', turma_id: turma.id, user_id: user.id
    disciplina.save
    atividade = Atividade.new titulo: 'escrita', descricao: "", bimestre: '3', data: '22/08/2020', disciplina_id: disciplina.id
    atividade.save

    avaliacao = Avaliacao.new pontos: 4, observacoes: 'até amanhã', atividade_id: atividade.id
    assert_not avaliacao.save
  end

  test 'criando avaliacao sem atividade' do
    # aluno
    turma = Turma.new letra: 'A', anoLetivo: '2020', ano: '5'
    turma.save
    aluno = Aluno.new nome: "Pedro Santana", turma_id: turma.id
    aluno.save

    avaliacao = Avaliacao.new pontos: 4, observacoes: 'até amanhã', aluno_id: aluno.id
    assert_not avaliacao.save
  end
end
