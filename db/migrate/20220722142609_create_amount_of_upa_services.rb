class CreateAmountOfUpaServices < ActiveRecord::Migration[7.0]
  def change
    create_table :amount_of_upa_services do |t|
      t.string :year_month
      t.float :registered
      t.float :classified
      t.float :attended
      t.float :welcomed
      t.float :service_time
      t.float :green_time
      t.float :green_in_the_goal
      t.float :green_off_target
      t.float :yellow_time
      t.float :yellow_in_the_goal
      t.float :yellow_off_target
      t.float :red_in_the_goal
      t.float :red_off_target

      t.timestamps
    end
  end
end
