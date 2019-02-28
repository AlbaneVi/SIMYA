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

ActiveRecord::Schema.define(version: 2019_02_27_174557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
  end

  create_table "custodies", force: :cascade do |t|
    t.date "day_on"
    t.string "title"
    t.text "text"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_custodies_on_user_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "photo"
    t.bigint "custody_id"
    t.index ["custody_id"], name: "index_media_on_custody_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.datetime "send_at"
    t.bigint "receiver_id"
    t.bigint "sender_id"
    t.boolean "read", default: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "avatar"
    t.bigint "child_id"
    t.index ["child_id"], name: "index_users_on_child_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
