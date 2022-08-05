class CensoSetor < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            CensoSetor.create! row.to_hash
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
        end
    end
end
