class DropTrips < ActiveRecord::Migration[5.1]
  def change
    drop_table :trips
  end
end
