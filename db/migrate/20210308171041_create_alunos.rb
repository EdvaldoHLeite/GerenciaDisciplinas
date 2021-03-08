class CreateAlunos < ActiveRecord::Migration[6.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.belongs_to :turma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
