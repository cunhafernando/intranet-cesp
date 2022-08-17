class CensoDiario < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            CensoDiario.create! row.to_hash
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
        end
    end
end
