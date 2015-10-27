class CreateStandups < ActiveRecord::Migration
  def change
    create_table :standups do |t|
      t.date :date, null: false
    end
  end
end
