class CreateProductionBySpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :production_by_specialties do |t|
      t.string :specialty
      t.float :foreseen
      t.float :accomplished
      t.float :performed_per_cent

      t.timestamps
    end
  end
end
