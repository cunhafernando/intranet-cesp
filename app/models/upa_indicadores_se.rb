class UpaIndicadoresSe < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            UpaIndicadoresSe.create! row.to_hash
            t.string "codigo"
            t.string "indicador"
            t.string "meta"
            t.string "variavel"
            t.string "descricao"
            t.string "medida"
            t.string "status"
        end
    end
end
