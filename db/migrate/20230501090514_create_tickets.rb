class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :total_fare,          null: false

      t.references :user,             null: true, foreign_key: true
      t.references :payment,          null: true, foreign_key: true
      t.references :trip,             null: true, foreign_key: true
      t.references :boarding,         null: true, foreign_key: true
      t.references :bus,              null: true, foreign_key: true

      t.timestamps,                   null: false
    end
  end
end
