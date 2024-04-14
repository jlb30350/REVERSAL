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

ActiveRecord::Schema[7.1].define(version: 2024_04_13_223410) do
  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lieu"
    t.string "reserver_name"
    t.string "reserver_phone"
    t.string "reserver_email"
    t.integer "salle_id"
    t.index ["salle_id"], name: "index_reservations_on_salle_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "salles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
    t.boolean "air_conditioning"
    t.boolean "sound_system"
    t.boolean "water_fountain"
    t.boolean "projector"
    t.string "wifi_code"
    t.integer "area"
    t.integer "table_count"
    t.text "description"
    t.boolean "fiber_internet"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservations", "salles"
  add_foreign_key "reservations", "users"
end
