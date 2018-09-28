class AddImagesToCountriesTable < ActiveRecord::Migration[5.1]
  def change
    change_table :countries do |t|
      t.remove :polygon_coordinatess
      t.text :images
    end
  end
end
