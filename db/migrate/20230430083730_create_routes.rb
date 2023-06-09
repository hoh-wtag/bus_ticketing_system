class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :source,         null: false
      t.string :destination,    null: false

      t.timestamps
    end
    add_index :routes, [:source, :destination], unique: true
  end
end
