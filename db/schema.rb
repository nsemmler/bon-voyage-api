# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181005144054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "native_name"
    t.string "capital"
    t.string "country_code"
    t.string "alpha_code"
    t.string "region"
    t.string "subregion"
    t.integer "population"
    t.float "latitude"
    t.float "longitude"
    t.text "bordered_by"
    t.string "currency_name"
    t.string "currency_symbol"
    t.text "languages"
    t.string "flag"
    t.integer "advisory_state"
    t.string "advisory_description"
    t.boolean "has_advisory_warning"
    t.boolean "has_regional_advisory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "images"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "point_of_interests", force: :cascade do |t|
    t.bigint "country_id"
    t.string "name"
    t.string "description"
    t.float "score"
    t.string "wikipedia_link"
    t.text "image"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_point_of_interests_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_users_favorites_on_country_id"
    t.index ["user_id"], name: "index_users_favorites_on_user_id"
  end

  add_foreign_key "point_of_interests", "countries"
  add_foreign_key "users_favorites", "countries"
  add_foreign_key "users_favorites", "users"
end
