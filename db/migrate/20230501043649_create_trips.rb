class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :ticket_price, null:false
      t.integer :total_booked, null:false
      t.date :trip_date, null:false
      t.time :trip_time, null:false

      t.references :bus, null: true, foreign_key: true
      t.references :route, null: true, foreign_key: true

      t.timestamps
    end
  end
end
