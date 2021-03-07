Given('Eu estou na pagina de cadastro') do
  visit 'users/new'
  expect(page).to have_current_path('/users/new')
end

Given('Preencho login com {string}, senha com {string} e confirmacao de senha com {string}') do |login, password, password_confirmation|
  fill_in 'user[login]', :with => login
  fill_in 'user[password]', :with => password
  fill_in 'user[password_confirmation]', :with => password_confirmation
end

When('Clico em cadastrar') do
  click_button 'submit'
end

Then('Vejo que o cadastro do login {string} foi efetuado') do |login|
  expect(page).to have_content(login)
  expect(page).to have_current_path('/users/' + User.last.id.to_s)
end

Given('O usuario de login {string} e senha {string} existe') do |login, password|
  visit 'users/new'
  expect(page).to have_current_path('/users/new')

  fill_in 'user[login]', :with => login
  fill_in 'user[password]', :with => password
  fill_in 'user[password_confirmation]', :with => password

  click_button 'submit'
end

Given('Eu estou na pagina de login') do
  visit '/login'
  expect(page).to have_current_path('/login')
end

Given('Preencho login com {string} e senha com {string}') do |login, password|
  fill_in 'Login', :with => login
  fill_in 'Password', :with => password
end

When('Clico em logar') do
  click_button 'Log In'
end

Then('Eu vejo que estou logado com login {string}') do |login|
  expect(page).to have_content(login)
  expect(page).to have_current_path('/users/' + User.last.id.to_s)
end

Then('Eu vejo a mensagem de erro {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Given('Eu estou na pagina do usuario com login {string}') do |login|
  visit '/users/' + User.last.id.to_s
  expect(page).to have_content(login)
  expect(page).to have_current_path('/users/' + User.last.id.to_s)
end

When('Clico em editar o usuario de login {string}') do |login|
  click_link 'editar-' + login
  expect(page).to have_current_path('/users/' + User.last.id.to_s + '/edit')
end

Given('Eu estou logado com login {string} e senha {string}') do |login, password|
  visit '/login'
  expect(page).to have_current_path('/login')

  fill_in 'Login', :with => login
  fill_in 'Password', :with => password

  click_button 'Log In'
end

When('Clico no botao editar') do
  click_button 'submit'
end