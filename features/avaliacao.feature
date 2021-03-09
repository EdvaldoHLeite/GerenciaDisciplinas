Feature: Avaliacao

  As a usuario do sistema GerenciaDisciplinas
  I want to cadastrar novas avaliacoes das atividades para os alunos
  so that eu possa ter controle de atividades avaliativas e pontuacoes dos alunos

  Scenario: criar avaliacao de uma atividade para um aluno
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    And A atividade de titulo "verbs", bimestre "1", descricao "em casa", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020" existe
    And O aluno de nome "João Alves" da turma do ano "5" "A" de "2020" existe
    Given Eu estou na pagina de criacao de avaliacao
    And Preencho pontos com "3", observacoes com "Errou muito", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono aluno de nome "João Alves"
    When Clico em criar avaliacao
    Then Vejo que a avaliacao foi criada com sucesso

  Scenario: criar avaliacao com descricao vazia
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    And A atividade de titulo "verbs", bimestre "1", descricao "em casa", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020" existe
    And O aluno de nome "João Alves" da turma do ano "5" "A" de "2020" existe
    Given Eu estou na pagina de criacao de avaliacao
    And Preencho pontos com "3", observacoes com "", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono aluno de nome "João Alves"
    When Clico em criar avaliacao
    Then Vejo que a avaliacao foi criada com sucesso

  Scenario: criar avaliacao fora do limite de pontos
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    And A atividade de titulo "verbs", bimestre "1", descricao "em casa", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020" existe
    And O aluno de nome "João Alves" da turma do ano "5" "A" de "2020" existe
    Given Eu estou na pagina de criacao de avaliacao
    And Preencho pontos com "11", observacoes com "Errou muito", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono aluno de nome "João Alves"
    When Clico em criar avaliacao
    Then Eu vejo a mensagem de erro "Pontuação de 0 até 10"

  Scenario: editar avaliacao
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    And A atividade de titulo "verbs", bimestre "1", descricao "em casa", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020" existe
    And O aluno de nome "João Alves" da turma do ano "5" "A" de "2020" existe
    And A avaliacao com "5" pontos, observacoes com "Metade", titulo "verbs" e bimestre "1" e nome de aluno "João Alves" existe
    Given Estou na pagina de avaliacoes
    And Clico em editar a ultima avaliacao
    And Preencho pontos com "3", observacoes com "Errou muito", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono aluno de nome "João Alves"
    When Clico em confirmar a edicao da avaliacao
    Then Vejo que a avaliacao foi editada com sucesso

  Scenario: editar avaliacao fora do limite de pontos
    Given O usuario de login "Evandro" e senha "123456" existe
    And Eu estou logado com login "Evandro" e senha "123456"
    And A turma de letra "A", ano "5" e ano letivo "2020" existe
    And A disciplina de nome "Inglês", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    And A atividade de titulo "verbs", bimestre "1", descricao "em casa", data "4" de "April" de "2020" da disciplina de nome "Inglês" e ano letivo "2020" existe
    And O aluno de nome "João Alves" da turma do ano "5" "A" de "2020" existe
    And A avaliacao com "5" pontos, observacoes com "Metade", titulo "verbs" e bimestre "1" e nome de aluno "João Alves" existe
    Given Estou na pagina de avaliacoes
    And Clico em editar a ultima avaliacao
    And Preencho pontos com "13", observacoes com "Metade", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono aluno de nome "João Alves"
    When Clico em confirmar a edicao da avaliacao
    Then Eu vejo a mensagem de erro "Pontuação de 0 até 10"