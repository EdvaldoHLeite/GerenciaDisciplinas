Given('Eu estou na pagina de cadastro de aluno') do
  visit '/alunos/new'
  expect(page).to have_current_path('/alunos/new')
end

Given('Preencho nome com {string} e seleciono a turma de ano {string} {string} do ano letivo {string}') do |nome, ano, letra, anoLetivo|
  fill_in 'aluno[nome]', with: nome
  select ano + "º-" + letra + "-" + anoLetivo, from: 'aluno[turma_id]'
end

When('Clico em cadastrar aluno') do
  click_button 'submit'
end

Then('Vejo que o aluno de nome {string} foi cadastrado') do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_current_path('/alunos/' + Aluno.last.id.to_s)
end

Given('O aluno de nome {string} da turma do ano {string} {string} de {string} existe') do |nome, ano, letra, anoLetivo|
  visit '/alunos/new'
  expect(page).to have_current_path('/alunos/new')

  fill_in 'aluno[nome]', with: nome
  select ano + "º-" + letra + "-" + anoLetivo, from: 'aluno[turma_id]'
  click_button 'submit'
end