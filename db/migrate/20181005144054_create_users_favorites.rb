class CreateUsersFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :users_favorites do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :country, foreign_key: { to_table: :countries }

      t.timestamps
    end
  end
end
