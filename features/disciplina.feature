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