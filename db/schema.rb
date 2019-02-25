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

ActiveRecord::Schema.define(version: 2019_02_25_175237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.date "date_start"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.bigint "children_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["children_id"], name: "index_folders_on_children_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "photo"
    t.bigint "events_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["events_id"], name: "index_media_on_events_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "message"
    t.date "date_start"
    t.date "date_end"
    t.string "status"
    t.bigint "children_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["children_id"], name: "index_requests_on_children_id"
  end

  create_table "residencies", force: :cascade do |t|
    t.date "date_start"
    t.date "date_end"
    t.bigint "users_id"
    t.bigint "transitions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transitions_id"], name: "index_residencies_on_transitions_id"
    t.index ["users_id"], name: "index_residencies_on_users_id"
  end

  create_table "transitions", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.bigint "child_id"
    t.string "avatar"
    t.index ["child_id"], name: "index_users_on_child_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "folders", "children", column: "children_id"
  add_foreign_key "media", "events", column: "events_id"
  add_foreign_key "requests", "children", column: "children_id"
  add_foreign_key "residencies", "transitions", column: "transitions_id"
  add_foreign_key "residencies", "users", column: "users_id"
  add_foreign_key "users", "children"
end
