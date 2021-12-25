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

ActiveRecord::Schema.define(version: 2021_12_24_214144) do

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.date "data_nascimento"
    t.integer "telefone"
    t.string "genero"
    t.string "tipo_pagamento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ies", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "tipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.decimal "valor_total"
    t.integer "qtd_fatura"
    t.integer "dia_vencimento"
    t.string "nome_curso"
    t.integer "ie_id", null: false
    t.integer "aluno_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["ie_id"], name: "index_matriculas_on_ie_id"
  end

  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "ies"
end
