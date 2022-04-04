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

ActiveRecord::Schema.define(version: 2022_04_04_124910) do

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
    t.index ["cik"], name: "index_companies_on_cik", unique: true
    t.index ["ticker"], name: "index_companies_on_ticker", unique: true
  end

end
