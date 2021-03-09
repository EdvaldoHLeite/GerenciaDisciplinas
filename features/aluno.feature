Feature: Aluno

  As a usuario do sistema GerenciaDisciplinas
  I want to me cadastrar, logar e editar cadastros dos alunos
  so that eu possa ter acesso e manipular informacoes dos alunos

  Scenario: cadastrar aluno em uma turma
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "8" e ano letivo "2020" existe
    Given Eu estou na pagina de cadastro de aluno
    And Preencho nome com "José Abdias" e seleciono a turma de ano "8" "A" do ano letivo "2020"
    When Clico em cadastrar aluno
    Then Vejo que o aluno de nome "José Abdias" foi cadastrado


