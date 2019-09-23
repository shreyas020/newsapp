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

ActiveRecord::Schema.define(version: 2019_09_23_083313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "long_description"
    t.string "short_description"
    t.integer "status", default: 0
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

  create_table "comments", force: :cascade do |t|
    t.string "comment_body"
    t.bigint "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "published_at"
    t.integer "status", default: 0
    t.bigint "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_galleries_on_catalog_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "url"
    t.bigint "mediable_id"
    t.string "mediable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mediable_type", "mediable_id"], name: "index_media_on_mediable_type_and_mediable_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "status", default: 0
    t.bigint "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_polls_on_catalog_id"
  end

  create_table "thumbnails", force: :cascade do |t|
    t.string "url"
    t.bigint "thumbnailable_id"
    t.string "thumbnailable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["thumbnailable_type", "thumbnailable_id"], name: "index_thumbnails_on_thumbnailable_type_and_thumbnailable_id"
  end

  add_foreign_key "galleries", "catalogs"
  add_foreign_key "polls", "catalogs"
end
