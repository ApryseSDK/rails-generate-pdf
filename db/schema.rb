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

ActiveRecord::Schema[7.1].define(version: 2024_04_10_013013) do
  create_table "invoice_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.integer "qty"
    t.integer "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "from_full_name"
    t.string "from_address"
    t.string "from_email"
    t.string "from_phone"
    t.string "to_full_name"
    t.string "to_address"
    t.string "to_email"
    t.string "to_phone"
    t.string "status"
    t.decimal "discount"
    t.decimal "vat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "invoice_items", "invoices"
end
