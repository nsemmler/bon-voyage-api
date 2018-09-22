class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name # :name through :flag - REST API
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
      t.text :polygon_coordinatess # OIPA API
      t.integer :advisory_state # :adv_state through :has_reg_advisory - TuGo API
      t.string :advisory_description
      t.boolean :has_advisory_warning
      t.boolean :has_regional_advisory

      t.timestamps
    end
  end
end
