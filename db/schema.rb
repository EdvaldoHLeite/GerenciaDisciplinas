# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_08_183505) do

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.integer "turma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turma_id"], name: "index_alunos_on_turma_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.integer "bimestre"
    t.date "data"
    t.integer "disciplina_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disciplina_id"], name: "index_atividades_on_disciplina_id"
  end

  create_table "avaliacaos", force: :cascade do |t|
    t.integer "pontos"
    t.text "observacoes"
    t.integer "atividade_id", null: false
    t.integer "aluno_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aluno_id"], name: "index_avaliacaos_on_aluno_id"
    t.index ["atividade_id"], name: "index_avaliacaos_on_atividade_id"
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "nome"
    t.integer "anoLetivo"
    t.integer "turma_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turma_id"], name: "index_disciplinas_on_turma_id"
    t.index ["user_id"], name: "index_disciplinas_on_user_id"
  end

  create_table "turmas", force: :cascade do |t|
    t.string "letra"
    t.integer "anoLetivo"
    t.integer "ano"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "alunos", "turmas"
  add_foreign_key "atividades", "disciplinas"
  add_foreign_key "avaliacaos", "alunos"
  add_foreign_key "avaliacaos", "atividades"
  add_foreign_key "disciplinas", "turmas"
  add_foreign_key "disciplinas", "users"
end
