class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :ticket_price, null:false
      t.integer :total_booked, null:false
      t.date :trip_date, null:false
      t.time :trip_time, null:false

      t.timestamps
    end
  end
end
