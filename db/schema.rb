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

ActiveRecord::Schema.define(version: 2022_04_21_223452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "number"
    t.float "amount"
    t.date "expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_accounts_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nomenclatures", force: :cascade do |t|
    t.string "generic_name"
    t.string "brand_name"
    t.string "manufacturer"
    t.integer "dosage_form"
    t.string "strength"
    t.integer "age"
    t.boolean "prescription", default: false, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.bigint "supply_id"
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_orders_on_recipe_id"
    t.index ["supply_id"], name: "index_orders_on_supply_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pharmacists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "number"
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.bigint "supply_id"
    t.integer "quantity", default: 1, null: false
    t.integer "age", default: 1, null: false
    t.date "expiry"
    t.text "comments"
    t.boolean "used", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_recipes_on_doctor_id"
    t.index ["supply_id"], name: "index_recipes_on_supply_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.bigint "nomenclature_id"
    t.bigint "pharmacist_id"
    t.integer "quantity", default: 1, null: false
    t.string "measure"
    t.float "price", default: 0.0, null: false
    t.float "amount", default: 0.0
    t.integer "reservation_quantity", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nomenclature_id"], name: "index_supplies_on_nomenclature_id"
    t.index ["pharmacist_id"], name: "index_supplies_on_pharmacist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "doctors"
  add_foreign_key "orders", "recipes"
  add_foreign_key "orders", "supplies"
  add_foreign_key "orders", "users"
  add_foreign_key "recipes", "doctors"
  add_foreign_key "recipes", "supplies"
  add_foreign_key "recipes", "users"
  add_foreign_key "supplies", "nomenclatures"
  add_foreign_key "supplies", "pharmacists"
end
