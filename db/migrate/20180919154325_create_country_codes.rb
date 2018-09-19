class CreateCountryCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :country_codes do |t|
      t.string :country_name
      t.string :country_code
      t.timestamps
    end
  end
end
