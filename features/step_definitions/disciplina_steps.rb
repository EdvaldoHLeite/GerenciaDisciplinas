Given('Eu estou na pagina de cadastro de disciplina') do
  visit '/disciplinas/new'
  expect(page).to have_current_path('/disciplinas/new')
end

Given('A turma de letra {string}, ano {string} e ano letivo {string} existe') do |letra, ano, anoLetivo|
  visit '/turmas/new'
  expect(page).to have_current_path('/turmas/new')

  fill_in 'turma[letra]', :with => letra
  fill_in 'turma[anoLetivo]', :with => anoLetivo
  fill_in 'turma[ano]', :with => ano
  click_button 'submit'
end

Given('Preencho nome com {string}, ano letivo com {string} e seleciono a turma {string} {string} de {string}') do |nome, anoLetivo, anoTurma, letraTurma, anoLetivoTurma|
  fill_in 'disciplina[nome]', :with => nome
  fill_in 'disciplina[anoLetivo]', :with => anoLetivo
  select anoTurma + "º-" + letraTurma + "-" + anoLetivoTurma, from: 'disciplina[turma_id]'
end

When('Clico em cadastrar disciplina') do
  click_button 'submit'
end

Then('Vejo que a disciplina de nome {string} foi criada') do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_current_path('/disciplinas/' + Disciplina.last.id.to_s)
end

Given('A disciplina de nome {string}, ano letivo {string} e turma do {string} ano {string} de {string} existe') do |nome, anoLetivoDisciplina, anoTurma, letraTurma, anoLetivoTurma|
  visit '/disciplinas/new'
  fill_in 'disciplina[nome]', :with => nome
  fill_in 'disciplina[anoLetivo]', :with => anoLetivoDisciplina
  select anoTurma + "º-" + letraTurma + "-" + anoLetivoTurma, from: 'disciplina[turma_id]'
  click_button 'submit'
end

Given('Eu estou na pagina da disciplina de nome {string}, ano letivo {string}, turma {string} ano {string} de {string}') do |nome, anoLetivoDisciplina, anoTurma, letraTurma, anoLetivoTurma|
  visit '/disciplinas/' + Disciplina.last.id.to_s
  expect(page).to have_content(nome)
  expect(page).to have_content(anoLetivoDisciplina)
  expect(page).to have_content(anoTurma)
  expect(page).to have_content(letraTurma)
  expect(page).to have_content(anoLetivoTurma)
end

Given('Clico em editar a disciplina de nome {string}, ano letivo {string}') do |nome, anoLetivo|
  click_link "edit-#{nome}-#{anoLetivo}-#{Turma.last.id.to_s}-#{User.last.id.to_s}"
  expect(page).to have_current_path('/disciplinas/' + Disciplina.last.id.to_s + '/edit')
end

When('Clico em editar a disciplina') do
  click_button 'submit'
end

Then('Vejo que a disciplina foi alterada com nome {string} e ano letivo {string}') do |nome, anoLetivo|
  expect(page).to have_content(nome)
  expect(page).to have_content(anoLetivo)
  expect(page).to have_current_path('/disciplinas/' + Disciplina.last.id.to_s)
end

Given('Eu estou na pagina das disciplinas') do
  visit '/disciplinas'
  expect(page).to have_current_path('/disciplinas')
end

When('Clico em remover a disciplina de nome {string}, ano letivo {string}') do |nome, anoLetivo|
  click_link "d-#{nome}-#{anoLetivo}-#{Disciplina.last.id.to_s}-#{User.last.id.to_s}"
end

Then('Vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end