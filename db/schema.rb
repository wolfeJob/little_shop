ActiveRecord::Schema.define(version: 20190819205407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.string "image"
    t.boolean "active?", default: true
    t.integer "inventory"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_items_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_reviews_on_item_id"
  end

  add_foreign_key "items", "merchants"
  add_foreign_key "reviews", "items"
end
