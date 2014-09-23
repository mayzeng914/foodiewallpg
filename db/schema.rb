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

ActiveRecord::Schema.define(version: 20140923025858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "foodiepicture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["foodiepicture_id"], name: "index_comments_on_foodiepicture_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "foodiepictures", force: true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "comments_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "foodiepictures", ["comments_id"], name: "index_foodiepictures_on_comments_id", using: :btree
  add_index "foodiepictures", ["user_id"], name: "index_foodiepictures_on_user_id", using: :btree

  create_table "sessions", force: true do |t|
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["users_id"], name: "index_sessions_on_users_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "foodiepictures_id"
    t.integer  "comments_id"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_fingerprint"
  end

  add_index "users", ["comments_id"], name: "index_users_on_comments_id", using: :btree
  add_index "users", ["foodiepictures_id"], name: "index_users_on_foodiepictures_id", using: :btree

end
