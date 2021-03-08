json.extract! avaliacao, :id, :pontos, :observacoes, :atividade_id, :aluno_id, :created_at, :updated_at
json.url avaliacao_url(avaliacao, format: :json)
