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
  select anoTurma + "º-" + letraTurma + "-" + anoLetivoTurma
end

When('Clico em cadastrar disciplina') do
  click_button 'submit'
end

Then('Vejo que a disciplina de nome {string} foi criada') do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_current_path('/disciplinas/' + Disciplina.last.id.to_s)
end

