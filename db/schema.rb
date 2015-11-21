# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151120205232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foodtag_photos", force: :cascade do |t|
    t.integer  "foodtag_id", null: false
    t.integer  "photo_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foodtags", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photo_pricetags", force: :cascade do |t|
    t.integer  "photo_id",    null: false
    t.integer  "pricetag_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photo_stashes", force: :cascade do |t|
    t.integer  "photo_id",   null: false
    t.integer  "stash_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photo_stashes", ["photo_id"], name: "index_photo_stashes_on_photo_id", using: :btree
  add_index "photo_stashes", ["stash_id"], name: "index_photo_stashes_on_stash_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id",                                     null: false
    t.string   "dish_name"
    t.decimal  "lng",                precision: 10, scale: 6
    t.decimal  "lat",                precision: 10, scale: 6
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["restaurant_id"], name: "index_photos_on_restaurant_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "pricetags", force: :cascade do |t|
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                                null: false
    t.decimal  "lng",        precision: 10, scale: 6
    t.decimal  "lat",        precision: 10, scale: 6
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "stashes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stashes", ["user_id"], name: "index_stashes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
