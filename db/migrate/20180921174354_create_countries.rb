class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :native_name
      t.string :capital
      t.string :country_code
      t.string :alpha_code
      t.string :region
      t.string :subregion
      t.integer :population
      t.float :latitude
      t.float :longitude
      t.text :bordered_by
      t.string :currency_name
      t.string :currency_symbol
      t.text :languages
      t.string :flag
      t.text :images

      t.timestamps
    end
  end
end
