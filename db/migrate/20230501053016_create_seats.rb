class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :seat_code, null:false
      t.integer :seat_status, null:false, default:0

      t.timestamps
    end
  end
end
