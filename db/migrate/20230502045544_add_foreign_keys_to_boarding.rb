class AddForeignKeysToBoarding < ActiveRecord::Migration[7.0]
  def change
    add_reference :boardings, :trip, index: true, foreign_key: true
    add_reference :boardings, :boarding_point, index: true, foreign_key: true
  end
end
