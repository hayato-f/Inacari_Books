# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2022_11_07_141839) do
  create_table "book_categories", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.string "title", null: false
    t.string "image"
    t.string "product_condition", null: false
    t.string "description"
    t.integer "price", null: false
    t.integer "postage", null: false
    t.boolean "published", null: false
    t.boolean "soldout", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment", null: false
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

<<<<<<< HEAD
  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
=======
  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "book_id"
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_order_details_on_book_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "buyer_id", null: false
    t.string "shipping_address", null: false
    t.integer "subtotal", null: false
    t.integer "postage", null: false
    t.integer "total_price", null: false
    t.integer "payment_method", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "account_name", null: false
    t.string "icon"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "tel", null: false
    t.string "shipping_address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_introduction"
  end

  add_foreign_key "order_details", "books"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "users", column: "buyer_id"
end
