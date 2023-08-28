# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_28_132617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "appoint_date"
    t.decimal "total_price", precision: 10, scale: 2
    t.decimal "discount_price", precision: 10, scale: 2
    t.bigint "furniture_id", null: false
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
    t.index ["furniture_id"], name: "index_appointments_on_furniture_id"
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.string "serial_number"
    t.string "image"
    t.text "description"
    t.decimal "upfront_price", precision: 10, scale: 2
    t.decimal "total_price", precision: 10, scale: 2
    t.integer "warranty_year"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_furnitures_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "type"
    t.string "serial_number"
    t.string "discount_price"
    t.string "upfront_price"
    t.string "total_price"
    t.string "size"
    t.string "customer_name"
    t.string "customer_id"
    t.string "warrant_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "role", default: "customer", null: false
    t.string "profile", default: "avatar.png", null: false
    t.string "jti", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "furnitures"
  add_foreign_key "appointments", "users", column: "customer_id"
  add_foreign_key "furnitures", "users"
end
