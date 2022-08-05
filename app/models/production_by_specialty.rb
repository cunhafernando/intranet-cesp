class ProductionBySpecialty < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            ProductionBySpecialty.create! row.to_hash
            t.string "specialty"
            t.float "foreseen"
            t.float "accomplished"
            t.float "performed_per_cent"
        end
    end
end
