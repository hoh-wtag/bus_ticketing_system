class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_code, null:false
      t.integer :bus_type, null: false, default: 0
      t.string :bus_company, null:false
      t.integer :bus_capacity, null: false, default: 0

      t.timestamps
    end
  end
end
