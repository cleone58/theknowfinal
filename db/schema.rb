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

ActiveRecord::Schema.define(version: 20160321210323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookmarks", ["event_id"], name: "index_bookmarks_on_event_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "api_event_id"
    t.string   "title"
    t.string   "image_url"
    t.integer  "api_venue_id"
    t.string   "venue_name"
    t.string   "city_name"
    t.string   "country_name"
    t.string   "category"
    t.string   "tickets_url"
    t.string   "state_prov"
    t.string   "avg_price"
    t.string   "datetime_local"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "postal_zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

  create_table "venues", force: :cascade do |t|
    t.integer  "api_venue_id"
    t.string   "name"
    t.string   "timezone"
    t.string   "address"
    t.string   "city"
    t.string   "state_prov"
    t.string   "postal_zip_code"
    t.string   "country"
    t.string   "tickets_url"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "extended_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "bookmarks", "events"
  add_foreign_key "bookmarks", "users"
end
