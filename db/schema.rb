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

ActiveRecord::Schema[7.0].define(version: 2023_04_14_083823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "signal_names", force: :cascade do |t|
    t.string "name"
  end

  create_table "signal_values", force: :cascade do |t|
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "signal_name_id"
    t.index ["signal_name_id"], name: "index_signal_values_on_signal_name_id"
  end

  add_foreign_key "signal_values", "signal_names"
end
