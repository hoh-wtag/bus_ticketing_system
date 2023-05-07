class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :code,               null: false
      t.integer :bus_type,          null: false, default: 0
      t.string :company,            null: false
      t.integer :capacity,          null: false, default: 0

      t.timestamps,                 null: false
    end

    add_index :buses, :code,        unique: true
  end
end
