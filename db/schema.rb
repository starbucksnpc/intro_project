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

ActiveRecord::Schema[7.1].define(version: 2024_06_28_113337) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_villains", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "villain_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_villains_on_book_id"
    t.index ["villain_id"], name: "index_book_villains_on_villain_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "year"
    t.string "title"
    t.integer "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_villains", force: :cascade do |t|
    t.integer "short_id", null: false
    t.integer "villain_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_id"], name: "index_short_villains_on_short_id"
    t.index ["villain_id"], name: "index_short_villains_on_villain_id"
  end

  create_table "shorts", force: :cascade do |t|
    t.string "title"
    t.string "short_type"
    t.string "handle"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "villains", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_villains", "books"
  add_foreign_key "book_villains", "villains"
  add_foreign_key "short_villains", "shorts"
  add_foreign_key "short_villains", "villains"
end
