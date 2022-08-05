class ComputedTomography < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            ComputedTomography.create! row.to_hash
            t.datetime "date"
            t.string "exam"
            t.string "sigtap_code"
            t.string "released_by"
            t.string "release_date"
            t.string "requesting_section"
            t.integer "amount"
            t.integer "number_of_reviews"
            t.string "procedure"
            t.float "value"
        end
    end
end
