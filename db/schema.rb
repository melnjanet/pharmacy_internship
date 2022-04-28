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

ActiveRecord::Schema.define(version: 2022_04_27_110500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "number"
    t.float "amount"
    t.date "expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_accounts_on_admin_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.boolean "active", default: true, null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "atc_codes", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_carts_on_item_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generic_names", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.bigint "nomenclature_id"
    t.bigint "admin_id"
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_items_on_admin_id"
    t.index ["nomenclature_id"], name: "index_items_on_nomenclature_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "order_id"
    t.bigint "item_id"
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "manufactures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nomenclatures", force: :cascade do |t|
    t.string "brand_name"
    t.integer "dosage_form", default: 0
    t.integer "strength"
    t.integer "age_group", default: 1
    t.boolean "prescription", default: false, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.bigint "atc_code_id"
    t.bigint "manufacture_id"
    t.bigint "generic_name_id"
    t.integer "strength_units", default: 0, null: false
    t.integer "package_size"
    t.integer "package_units", default: 0, null: false
    t.index ["atc_code_id"], name: "index_nomenclatures_on_atc_code_id"
    t.index ["country_id"], name: "index_nomenclatures_on_country_id"
    t.index ["generic_name_id"], name: "index_nomenclatures_on_generic_name_id"
    t.index ["manufacture_id"], name: "index_nomenclatures_on_manufacture_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "line_item_id"
    t.text "comment"
    t.integer "state"
    t.index ["line_item_id"], name: "index_orders_on_line_item_id"
    t.index ["recipe_id"], name: "index_orders_on_recipe_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "number"
    t.bigint "user_id"
    t.integer "quantity", default: 1, null: false
    t.integer "age_group", default: 1, null: false
    t.date "expiry"
    t.boolean "used", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id"
    t.bigint "order_id"
    t.bigint "item_id"
    t.index ["admin_id"], name: "index_recipes_on_admin_id"
    t.index ["item_id"], name: "index_recipes_on_item_id"
    t.index ["order_id"], name: "index_recipes_on_order_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
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

  add_foreign_key "carts", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "items", "admins"
  add_foreign_key "items", "nomenclatures"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "items"
  add_foreign_key "line_items", "orders"
  add_foreign_key "orders", "recipes"
  add_foreign_key "orders", "users"
  add_foreign_key "recipes", "users"
end
