class CreateAtividades < ActiveRecord::Migration[6.1]
  def change
    create_table :atividades do |t|
      t.string :titulo
      t.text :descricao
      t.integer :bimestre
      t.date :data
      t.belongs_to :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
