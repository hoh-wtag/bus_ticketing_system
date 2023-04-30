class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :route_source, null: false
      t.string :route_destination, null: false

      t.timestamps
    end
  end
end
