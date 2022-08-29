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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_162022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amount_of_upa_services", force: :cascade do |t|
    t.string "year_month"
    t.float "registered"
    t.float "classified"
    t.float "attended"
    t.float "welcomed"
    t.float "service_time"
    t.float "green_time"
    t.float "green_in_the_goal"
    t.float "green_off_target"
    t.float "yellow_time"
    t.float "yellow_in_the_goal"
    t.float "yellow_off_target"
    t.float "red_in_the_goal"
    t.float "red_off_target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "censo_diarios", force: :cascade do |t|
    t.string "secao"
    t.string "leito"
    t.string "boletim"
    t.string "pulseira"
    t.string "prontuario"
    t.string "paciente"
    t.string "sexo"
    t.string "nascimento"
    t.string "convenio"
    t.string "internacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "censo_setors", force: :cascade do |t|
    t.string "secao"
    t.float "leitos"
    t.float "leitos_extra"
    t.float "leitos_dia"
    t.float "pacientes_dia"
    t.float "internados"
    t.float "transf_interna_entradas"
    t.float "total_de_entradas"
    t.float "altas"
    t.float "transf_externa"
    t.float "obito_maior"
    t.float "obito_menor"
    t.float "transf_interna_saida"
    t.float "total_de_saidas"
    t.float "mpd"
    t.float "toco"
    t.float "toch"
    t.float "mpe"
    t.float "tmg"
    t.float "tmi"
    t.float "ir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computed_tomographies", force: :cascade do |t|
    t.datetime "date"
    t.string "exam"
    t.string "sigtap_code"
    t.string "released_by"
    t.datetime "release_date"
    t.string "requesting_section"
    t.integer "amount"
    t.integer "number_of_reviews"
    t.string "procedure"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consolidados", force: :cascade do |t|
    t.float "leitos"
    t.float "leitos_extra"
    t.float "leitos_dia"
    t.float "pacientes_dia"
    t.float "internados"
    t.float "total_de_entradas"
    t.float "altas"
    t.float "transf_externa"
    t.float "obito_maior"
    t.float "obito_menor"
    t.float "total_de_saidas"
    t.float "mpd"
    t.float "toco"
    t.float "toch"
    t.float "mpe"
    t.float "tmg"
    t.float "tmi"
    t.float "ir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hojeqtdatendimentos", force: :cascade do |t|
    t.string "ano_mes"
    t.float "registrados"
    t.float "classificados"
    t.float "atendidos"
    t.float "acolhidos"
    t.float "tm_atendimento"
    t.float "tm_verde"
    t.float "verde_meta"
    t.float "verde_fora_meta"
    t.float "tm_amarelo"
    t.float "amarelo_meta"
    t.float "amarelo_fora_meta"
    t.float "vermelho_meta"
    t.float "vermelho_fora_meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "risco"
    t.string "tipo_entrada"
    t.string "profissional"
    t.string "especialidade"
    t.string "linha_cuidado"
    t.string "boletim"
    t.string "entrada"
    t.string "classificacao"
    t.string "encaminhamento"
    t.string "atendimento_primeira"
    t.string "inicio_atendimento"
    t.string "fim_atendimento"
    t.string "alta"
    t.string "nome"
    t.string "idade"
    t.string "sexo"
    t.string "raca"
    t.float "tm_atendimento"
    t.float "tm_cr"
    t.float "tm_classxatend"
    t.string "meta"
    t.string "cod_diag"
    t.string "diagnostico"
    t.string "tipo_problema"
    t.string "motivo_alta"
    t.string "bairro"
    t.string "municipio"
    t.string "convenio"
    t.string "numero_sisreg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_by_specialties", force: :cascade do |t|
    t.string "specialty"
    t.float "foreseen"
    t.float "accomplished"
    t.float "performed_per_cent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upa_indicadores_ses", force: :cascade do |t|
    t.string "codigo"
    t.string "indicador"
    t.string "meta"
    t.string "variavel"
    t.string "descricao"
    t.string "medida"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
