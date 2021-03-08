class CreateDisciplinas < ActiveRecord::Migration[6.1]
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.integer :anoLetivo
      t.belongs_to :turma, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      #t.integer :turma_id
      #t.integer :user_id

      t.timestamps
    end
  end
end
