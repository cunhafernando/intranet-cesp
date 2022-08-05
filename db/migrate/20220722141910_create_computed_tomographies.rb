class CreateComputedTomographies < ActiveRecord::Migration[7.0]
  def change
    create_table :computed_tomographies do |t|
      t.datetime :date
      t.string :exam
      t.string :sigtap_code
      t.string :released_by
      t.datetime :release_date
      t.string :requesting_section
      t.integer :amount
      t.integer :number_of_reviews
      t.string :procedure
      t.integer :value

      t.timestamps
    end
  end
end
