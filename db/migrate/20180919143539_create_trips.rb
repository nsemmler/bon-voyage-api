class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string :destination_name
      t.string :destination_country_code
      t.string :destination_region
      t.string :destination_subregion, null: true
      t.text :destination_languages, null: true
      t.date :departed
      t.date :returned
      t.boolean :flew, default: false
      t.boolean :drove, default: false
      t.boolean :took_train, default: false
      t.boolean :booked_hotel, default: false
      t.string :departure_origin_iata_code, default: nil
      t.string :departure_destination_iata_code, default: nil
      t.string :return_origin_iata_code, default: nil
      t.string :return_destination_iata_code, default: nil

      t.timestamps
    end
  end
end
