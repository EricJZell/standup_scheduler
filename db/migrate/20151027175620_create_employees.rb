class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: true
    end
  end
end
