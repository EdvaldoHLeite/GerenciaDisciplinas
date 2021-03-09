Given('Eu estou na pagina de cadastro de atividade') do
  visit '/atividades/new'
end

Given('Preencho titulo com {string}, descricao {string}, bimestre {string}, data {string} de {string} de {string} da disciplina de nome {string} e ano letivo {string}') do |titulo, descricao, bimestre, dia, mes, ano, nomeDisciplina, anoLetivoDisciplina|
  fill_in 'atividade[titulo]', with: titulo
  fill_in 'atividade[descricao]', with: descricao
  fill_in 'atividade[bimestre]', with: bimestre
  select ano, from: 'atividade[data(1i)]'
  select mes, from: 'atividade[data(2i)]'
  select dia, from: 'atividade[data(3i)]'
  select nomeDisciplina + "-" + anoLetivoDisciplina + "-" + Turma.last.id.to_s, from: 'atividade[disciplina_id]'
end

When('Clico em cadastrar a atividade') do
  click_button 'submit'
end

Then('Vejo que a atividade de titulo {string} e bimestre {string} foi criada com sucesso') do |titulo, bimestre|
  expect(page).to have_content(titulo)
  expect(page).to have_content(bimestre)
  expect(page).to have_current_path('/atividades/' + Atividade.last.id.to_s)
end