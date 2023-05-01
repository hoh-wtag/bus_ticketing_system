class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :total_fare, null: false

      t.timestamps
    end
  end
end
