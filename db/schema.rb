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

ActiveRecord::Schema.define(version: 20160214011239) do

  create_table "cities", force: :cascade do |t|
    t.integer "prefecture_id", limit: 4
    t.string  "name",          limit: 255
    t.string  "name_kana",     limit: 255
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree
  add_index "cities", ["name_kana"], name: "index_cities_on_name_kana", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "owner_id",        limit: 4
    t.string   "title",           limit: 255
    t.string   "sport",           limit: 255
    t.integer  "fixed_number",    limit: 4
    t.integer  "status",          limit: 4,     default: 0
    t.string   "location",        limit: 255
    t.text     "information",     limit: 65535
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "favorites_count", limit: 4,     default: 0
    t.datetime "deadline"
    t.string   "fee",             limit: 255
    t.integer  "group_id",        limit: 4,     default: 0
    t.string   "prefecture_id",   limit: 255
    t.string   "city_id",         limit: 255
  end

  add_index "events", ["owner_id"], name: "index_events_on_owner_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitationships", force: :cascade do |t|
    t.integer  "inviter_id", limit: 4
    t.integer  "invited_id", limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitationships", ["invited_id"], name: "index_invitationships_on_invited_id", using: :btree
  add_index "invitationships", ["inviter_id"], name: "index_invitationships_on_inviter_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefectures", force: :cascade do |t|
    t.integer "prefecture_id", limit: 4
    t.string  "name",          limit: 255
    t.string  "name_kana",     limit: 255
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "family_name",            limit: 255
    t.string   "first_name",             limit: 255
    t.string   "gender",                 limit: 255
    t.integer  "age",                    limit: 4
    t.string   "organization",           limit: 255
    t.string   "job",                    limit: 255
    t.text     "interest",               limit: 65535
    t.text     "introduce",              limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
