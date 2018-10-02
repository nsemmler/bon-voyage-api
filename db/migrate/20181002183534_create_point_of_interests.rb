class CreatePointOfInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :point_of_interests do |t|
      t.references :country, foreign_key: { to_table: :countries }
      t.string :name
      t.string :description
      t.float :score
      t.string :wikipedia_link
      t.text :image
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
