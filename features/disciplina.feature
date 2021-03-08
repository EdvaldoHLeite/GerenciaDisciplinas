Feature: disciplina

  As a usuario do sistema GerenciaDisciplinas
  I want to cadastrar, editar e visualizar disciplinas
  so that eu possa ter controle das disciplinas nas turmas que leciono

  Scenario: cadastrar disciplina
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "8" e ano letivo "2020" existe
    Given Eu estou na pagina de cadastro de disciplina
    And Preencho nome com "Inglês", ano letivo com "2020" e seleciono a turma "8" "A" de "2020"
    When Clico em cadastrar disciplina
    Then Vejo que a disciplina de nome "Inglês" foi criada

  Scenario: editar disciplina
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "8" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "8" ano "A" de "2020" existe
    Given Eu estou na pagina da disciplina de nome "Inglês", ano letivo "2020", turma "8" ano "A" de "2020"
    And Clico em editar a disciplina de nome "Inglês", ano letivo "2020"
    And Preencho nome com "Espanhol", ano letivo com "2021" e seleciono a turma "8" "A" de "2020"
    When Clico em editar a disciplina
    Then Vejo que a disciplina foi alterada com nome "Espanhol" e ano letivo "2021"

  Scenario: cadastrar disciplina com ano letivo menor que o permitido
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "8" e ano letivo "2020" existe
    Given Eu estou na pagina de cadastro de disciplina
    And Preencho nome com "Inglês", ano letivo com "1999" e seleciono a turma "8" "A" de "2020"
    When Clico em cadastrar disciplina
    Then Eu vejo a mensagem de erro "Ano letivo a partir de 2020"

  Scenario: cadastrar disciplina com nome de quantidade de caracteres nao permitido
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "8" e ano letivo "2020" existe
    Given Eu estou na pagina de cadastro de disciplina
    And Preencho nome com "EDG", ano letivo com "2020" e seleciono a turma "8" "A" de "2020"
    When Clico em cadastrar disciplina
    Then Eu vejo a mensagem de erro "Tamanho do nome de 4-20 caracteres"

  Scenario: remover disciplina
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "8" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "8" ano "A" de "2020" existe
    Given Eu estou na pagina das disciplinas
    When Clico em remover a disciplina de nome "Inglês", ano letivo "2020"
    Then Vejo a mensagem "Disciplina was successfully destroyed"