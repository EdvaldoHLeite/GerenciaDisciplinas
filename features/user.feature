Feature: User

  As a usuario do sistema GerenciaDisciplinas
  I want to me cadastrar, logar e editar meu cadastro
  so that eu possa ter acesso restrito as minhas informacoes no sistema

  Scenario: cadastro no sistema
    Given Eu estou na pagina de cadastro
    And Preencho login com "Evandro", senha com "123456" e confirmacao de senha com "123456"
    When Clico em cadastrar
    Then Vejo que o cadastro do login "Evandro" foi efetuado

  Scenario: logar no sistema
    Given O usuario de login "Evandro" e senha "123456" existe
    Given Eu estou na pagina de login
    And Preencho login com "Evandro" e senha com "123456"
    When Clico em logar
    Then Eu vejo que estou logado com login "Evandro"

  Scenario: cadastro com login errado
    Given Eu estou na pagina de cadastro
    And Preencho login com "Evd", senha com "123456" e confirmacao de senha com "123456"
    When Clico em cadastrar
    Then Eu vejo a mensagem de erro "Login is too short (minimum is 5 characters)"

  Scenario: cadastro com senha diferente de confirmacao de senha
    Given Eu estou na pagina de cadastro
    And Preencho login com "Evandro", senha com "123" e confirmacao de senha com "123456"
    When Clico em cadastrar
    Then Eu vejo a mensagem de erro "Password confirmation doesn't match Password"

  Scenario: editar login errado
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And Eu estou na pagina do usuario com login "Evandro"
    When Clico em editar o usuario de login "Evandro"
    And Preencho login com "Evd", senha com "12345678" e confirmacao de senha com "12345678"
    When Clico no botao editar
    Then Eu vejo a mensagem de erro "Login is too short"
