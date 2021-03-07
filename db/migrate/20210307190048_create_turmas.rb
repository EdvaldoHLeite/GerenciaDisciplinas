class CreateTurmas < ActiveRecord::Migration[6.1]
  def change
    create_table :turmas do |t|
      t.string :letra
      t.date :anoLetivo
      t.integer :ano

      t.timestamps
    end
  end
end
