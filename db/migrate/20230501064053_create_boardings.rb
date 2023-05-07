class CreateBoardings < ActiveRecord::Migration[7.0]
  def change
    create_table :boardings do |t|
      t.time :time,       null: false

      t.timestamps,       null: false
    end
  end
end
