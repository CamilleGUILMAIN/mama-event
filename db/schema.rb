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

ActiveRecord::Schema[7.1].define(version: 2024_11_26_152046) do
  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "contact_email"
    t.string "phone_number"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "date"
    t.string "location"
    t.integer "charity_id", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_id"], name: "index_events_on_charity_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.decimal "unit_price"
    t.integer "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_options_on_ticket_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "participation_id", null: false
    t.integer "quantity"
    t.integer "options_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options_id"], name: "index_orders_on_options_id"
    t.index ["participation_id"], name: "index_orders_on_participation_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_participants_on_team_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "ticket_id", null: false
    t.string "status"
    t.integer "payment_id", null: false
    t.decimal "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_participations_on_participant_id"
    t.index ["payment_id"], name: "index_participations_on_payment_id"
    t.index ["ticket_id"], name: "index_participations_on_ticket_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.string "status"
    t.string "payment_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "unit_price"
    t.boolean "present"
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  add_foreign_key "events", "charities"
  add_foreign_key "options", "tickets"
  add_foreign_key "orders", "options", column: "options_id"
  add_foreign_key "orders", "participations"
  add_foreign_key "participants", "teams"
  add_foreign_key "participations", "participants"
  add_foreign_key "participations", "payments"
  add_foreign_key "participations", "tickets"
  add_foreign_key "tickets", "events"
end