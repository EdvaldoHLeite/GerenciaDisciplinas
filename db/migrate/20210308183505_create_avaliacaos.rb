class CreateAvaliacaos < ActiveRecord::Migration[6.1]
  def change
    create_table :avaliacaos do |t|
      t.integer :pontos
      t.text :observacoes
      t.belongs_to :atividade, null: false, foreign_key: true
      t.belongs_to :aluno, null: false, foreign_key: true

      t.timestamps
    end
  end
end
