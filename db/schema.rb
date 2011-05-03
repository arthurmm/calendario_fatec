# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110502234030) do

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "rg"
    t.date     "data_de_nascimento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cpf"
    t.string   "nome_conhecido"
    t.string   "sexo",               :limit => nil
    t.string   "tipo",               :limit => nil
  end

  create_table "contatos", :force => true do |t|
    t.string   "valor"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historicos", :force => true do |t|
    t.string   "descricao"
    t.integer  "ordem_servico_id"
    t.integer  "situacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordem_servico", :force => true do |t|
    t.string   "tipo_pedido"
    t.string   "descricao_equipamento"
    t.string   "descricao_defeito"
    t.string   "descricao_servico_realizado"
    t.string   "diagnostico_tecnico"
    t.string   "numero_serie_equipamento"
    t.string   "descricao_pecas"
    t.decimal  "valor_servico"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "situacao"
    t.integer  "tipo_equipamento_id"
    t.string   "codigo"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tipo_equipamentos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
