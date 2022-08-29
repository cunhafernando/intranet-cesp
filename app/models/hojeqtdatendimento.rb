class Hojeqtdatendimento < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Hojeqtdatendimento.create! row.to_hash
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
        end
    end
end
