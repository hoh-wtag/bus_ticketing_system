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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_053621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boarding_points", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_boarding_points_on_name", unique: true
  end

  create_table "boardings", force: :cascade do |t|
    t.time "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.bigint "boarding_point_id"
    t.index ["boarding_point_id"], name: "index_boardings_on_boarding_point_id"
    t.index ["trip_id"], name: "index_boardings_on_trip_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "code", null: false
    t.integer "bus_type", default: 0, null: false
    t.string "company", null: false
    t.integer "capacity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_buses_on_code", unique: true
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.string "scopes"
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "source", null: false
    t.string "destination", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source", "destination"], name: "index_routes_on_source_and_destination", unique: true
  end

  create_table "seats", force: :cascade do |t|
    t.string "code", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.bigint "trip_id"
    t.index ["ticket_id"], name: "index_seats_on_ticket_id"
    t.index ["trip_id"], name: "index_seats_on_trip_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "total_fare", null: false
    t.bigint "user_id"
    t.bigint "payment_id"
    t.bigint "trip_id"
    t.bigint "boarding_id"
    t.bigint "bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boarding_id"], name: "index_tickets_on_boarding_id"
    t.index ["bus_id"], name: "index_tickets_on_bus_id"
    t.index ["payment_id"], name: "index_tickets_on_payment_id"
    t.index ["trip_id"], name: "index_tickets_on_trip_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "ticket_price", null: false
    t.integer "total_booked", default: 0, null: false
    t.date "date", null: false
    t.time "time", null: false
    t.bigint "bus_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_trips_on_bus_id"
    t.index ["route_id"], name: "index_trips_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "user_name", null: false
    t.string "phone", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "boardings", "boarding_points"
  add_foreign_key "boardings", "trips"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
  add_foreign_key "seats", "tickets"
  add_foreign_key "seats", "trips"
  add_foreign_key "tickets", "boardings"
  add_foreign_key "tickets", "buses"
  add_foreign_key "tickets", "payments"
  add_foreign_key "tickets", "trips"
  add_foreign_key "tickets", "users"
  add_foreign_key "trips", "buses"
  add_foreign_key "trips", "routes"
end
