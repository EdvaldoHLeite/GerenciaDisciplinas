json.extract! aluno, :id, :nome, :turma_id, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
