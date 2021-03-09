Feature: Atividade

  As a usuario do sistema GerenciaDisciplinas
  I want to cadastrar novas atividades das disciplinas
  so that eu possa ter controle de atividades dentro da disciplina

  Scenario: criar atividade de uma disciplina
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given Eu estou na pagina de cadastro de atividade
    And Preencho titulo com "Modal Verbs", descricao "amanhã", bimestre "1", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020"
    When Clico em cadastrar a atividade
    Then Vejo que a atividade de titulo "Modal Verbs" e bimestre "1" foi criada com sucesso

  Scenario: criar atividade com titulo menor que 5
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given Eu estou na pagina de cadastro de atividade
    And Preencho titulo com "vrb", descricao "amanhã", bimestre "1", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020"
    When Clico em cadastrar a atividade
    Then Eu vejo a mensagem de erro "Tamanho do titulo de 5-20 caracteres"

  Scenario: criar atividade com descricao vazia
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given Eu estou na pagina de cadastro de atividade
    And Preencho titulo com "Modal Verbs", descricao "", bimestre "1", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020"
    When Clico em cadastrar a atividade
    Then Vejo que a atividade de titulo "Modal Verbs" e bimestre "1" foi criada com sucesso

  Scenario: criar atividade com bimestre maior que 4
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given Eu estou na pagina de cadastro de atividade
    And Preencho titulo com "Modal Verbs", descricao "amanhã", bimestre "5", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020"
    When Clico em cadastrar a atividade
    Then Eu vejo a mensagem de erro "Bimestre somente de 1 a 4"

  Scenario: criar atividade com bimestre menor que 1
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given Eu estou na pagina de cadastro de atividade
    And Preencho titulo com "Modal Verbs", descricao "amanhã", bimestre "0", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020"
    When Clico em cadastrar a atividade
    Then Eu vejo a mensagem de erro "Bimestre somente de 1 a 4"