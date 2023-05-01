class CreateBoardingPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :boarding_points do |t|
      t.string :boarding_point_name, null:false

      t.timestamps
    end
  end
end
