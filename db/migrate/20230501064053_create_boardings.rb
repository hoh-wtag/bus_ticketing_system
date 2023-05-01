class CreateBoardings < ActiveRecord::Migration[7.0]
  def change
    create_table :boardings do |t|
      t.time :boarding_time, null:false

      t.timestamps
    end
  end
end
