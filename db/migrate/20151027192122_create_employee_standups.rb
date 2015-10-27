class CreateEmployeeStandups < ActiveRecord::Migration
  def change
    create_table :employee_standups do |t|
      t.integer :employee_id, null: false
      t.integer :standup_id, null: false
    end
  end
end
