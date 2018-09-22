class DropCountryCodesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :country_codes
  end
end
