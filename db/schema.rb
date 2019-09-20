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

ActiveRecord::Schema.define(version: 2019_09_19_050927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "long_description"
    t.string "short_description"
    t.string "status", default: "created"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "catalog_id"
    t.index ["catalog_id"], name: "index_articles_on_catalog_id"
  end

  create_table "catalogs", force: :cascade do |t|
    t.string "name"
    t.integer "ctype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ctype"], name: "index_catalogs_on_ctype"
    t.index ["name"], name: "index_catalogs_on_name"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "published_at"
    t.string "status", default: "created"
    t.bigint "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_galleries_on_catalog_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "status"
    t.bigint "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_polls_on_catalog_id"
  end

  add_foreign_key "galleries", "catalogs"
  add_foreign_key "polls", "catalogs"
end
