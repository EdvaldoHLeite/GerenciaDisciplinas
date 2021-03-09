Given('A atividade de titulo {string}, bimestre {string}, descricao {string}, data {string} de {string} de {string} da disciplina de nome {string} e ano letivo {string} existe') do |titulo, bimestre, descricao, dia, mes, ano, nomeDisciplina, anoLetivoDisciplina|
  visit '/atividades/new'
  expect(page).to have_current_path('/atividades/new')

  fill_in 'atividade[titulo]', with: titulo
  fill_in 'atividade[descricao]', with: descricao
  fill_in 'atividade[bimestre]', with: bimestre
  select ano, from: 'atividade[data(1i)]'
  select mes, from: 'atividade[data(2i)]'
  select dia, from: 'atividade[data(3i)]'
  select nomeDisciplina + "-" + anoLetivoDisciplina + "-" + Turma.last.id.to_s, from: 'atividade[disciplina_id]'

  click_button 'submit'
  expect(page).to have_current_path('/atividades/' + Atividade.last.id.to_s)
end

Given('Eu estou na pagina de criacao de avaliacao') do
  visit '/avaliacaos/new'
  expect(page).to have_current_path('/avaliacaos/new')
end

Given('Preencho pontos com {string}, observacoes com {string}, seleciono atividade de titulo {string} e bimestre {string} e seleciono aluno de nome {string}') do |pontos, observacoes, tituloAtividade, bimestreAtividade, nomeAluno|
  fill_in 'avaliacao[pontos]', with: pontos
  fill_in 'avaliacao[observacoes]', with: observacoes
  select tituloAtividade + "-" + bimestreAtividade, from: 'avaliacao[atividade_id]'
  select nomeAluno, from: 'avaliacao[aluno_id]'
end

When('Clico em criar avaliacao') do
  click_button 'submit'
end

Then('Vejo que a avaliacao foi criada com sucesso') do
  expect(page).to have_current_path('/avaliacaos/' + Avaliacao.last.id.to_s)
end

Given('A avaliacao com {string} pontos, observacoes com {string}, titulo {string} e bimestre {string} e nome de aluno {string} existe') do |pontos, observacoes, tituloAtividade, bimestreAtividade, nomeAluno|
  visit '/avaliacaos/new'
  expect(page).to have_current_path('/avaliacaos/new')

  fill_in 'avaliacao[pontos]', with: pontos
  fill_in 'avaliacao[observacoes]', with: observacoes
  select tituloAtividade + "-" + bimestreAtividade, from: 'avaliacao[atividade_id]'
  select nomeAluno, from: 'avaliacao[aluno_id]'

  click_button 'submit'
end

Given('Estou na pagina de avaliacoes') do
  visit '/avaliacaos'
  expect(page).to have_current_path('/avaliacaos')
end

Given('Clico em editar a ultima avaliacao') do
  click_link "e-#{Avaliacao.last.id.to_s}-#{Aluno.last.id.to_s}"
end

When('Clico em confirmar a edicao da avaliacao') do
  click_button 'submit'
end

Then('Vejo que a avaliacao foi editada com sucesso') do
  expect(page).to have_current_path('/avaliacaos/'  + Avaliacao.last.id.to_s)
end

Given('Clico em remover a ultima avaliacao') do
  click_link "d-#{Avaliacao.last.id.to_s}-#{Aluno.last.id.to_s}"
end

When('Clico em confirmar a remocao da avaliacao') do
  click_button "OK"
end