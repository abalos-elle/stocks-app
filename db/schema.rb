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

ActiveRecord::Schema.define(version: 2022_04_25_140010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "cik", null: false
    t.string "name", null: false
    t.string "ticker", null: false
    t.json "prices"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "exchange"
    t.string "asset_type"
    t.decimal "latest_price", precision: 15, scale: 4
    t.decimal "previous_close", precision: 15, scale: 4
    t.json "market_capitalization"
    t.json "beta"
    t.json "pe_ratio"
    t.json "eps"
    t.json "ex_dividend_date"
    t.decimal "dividend_per_share"
    t.decimal "dividend_yield"
    t.decimal "forward_pe"
    t.decimal "ebitda"
    t.decimal "profit_margin"
    t.index ["cik"], name: "index_companies_on_cik", unique: true
    t.index ["ticker"], name: "index_companies_on_ticker", unique: true
  end

  create_table "owned_stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_owned_stocks_on_company_id"
    t.index ["user_id"], name: "index_owned_stocks_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "code"
    t.integer "type"
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.integer "quantity"
    t.decimal "price", precision: 15, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_transactions_on_company_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.date "birthday", null: false
    t.string "mobile", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "roles"
    t.decimal "wallet_balance", precision: 15, scale: 2, default: "100.0"
    t.boolean "is_approved", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "owned_stocks", "companies"
  add_foreign_key "owned_stocks", "users"
  add_foreign_key "transactions", "companies"
  add_foreign_key "transactions", "users"
end
