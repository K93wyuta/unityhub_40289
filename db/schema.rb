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

ActiveRecord::Schema[7.0].define(version: 2024_04_12_035334) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "albums", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_albums_on_channel_id"
  end

  create_table "channel_chat_users", charset: "utf8", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "channel_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_user_id"], name: "index_channel_chat_users_on_channel_user_id"
    t.index ["chat_id"], name: "index_channel_chat_users_on_chat_id"
  end

  create_table "channel_event_users", charset: "utf8", force: :cascade do |t|
    t.bigint "channel_user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_user_id"], name: "index_channel_event_users_on_channel_user_id"
    t.index ["event_id"], name: "index_channel_event_users_on_event_id"
  end

  create_table "channel_users", charset: "utf8", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "administrator"
    t.index ["channel_id"], name: "index_channel_users_on_channel_id"
    t.index ["user_id"], name: "index_channel_users_on_user_id"
  end

  create_table "channels", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "identification", null: false
    t.string "password_digest", null: false
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_chats_on_channel_id"
  end

  create_table "events", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "date_start", null: false
    t.date "date_end", null: false
    t.string "place"
    t.text "detail"
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_start"
    t.datetime "time_end"
    t.bigint "channel_user_id", null: false
    t.index ["channel_id"], name: "index_events_on_channel_id"
    t.index ["channel_user_id"], name: "index_events_on_channel_user_id"
  end

  create_table "messages", charset: "utf8", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "channel_chat_user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_chat_user_id"], name: "index_messages_on_channel_chat_user_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "topics", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "text", null: false
    t.bigint "channel_user_id", null: false
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_topics_on_channel_id"
    t.index ["channel_user_id"], name: "index_topics_on_channel_user_id"
  end

  create_table "tweets", charset: "utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "channel_user_id", null: false
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_tweets_on_channel_id"
    t.index ["channel_user_id"], name: "index_tweets_on_channel_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "gender_id"
    t.integer "age_id"
    t.date "birthday"
    t.integer "mbti_id"
    t.string "line"
    t.string "paypay"
    t.text "profile"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums", "channels"
  add_foreign_key "channel_chat_users", "channel_users"
  add_foreign_key "channel_chat_users", "chats"
  add_foreign_key "channel_event_users", "channel_users"
  add_foreign_key "channel_event_users", "events"
  add_foreign_key "channel_users", "channels"
  add_foreign_key "channel_users", "users"
  add_foreign_key "chats", "channels"
  add_foreign_key "events", "channels"
  add_foreign_key "messages", "channel_chat_users"
  add_foreign_key "messages", "chats"
  add_foreign_key "topics", "channel_users"
  add_foreign_key "topics", "channels"
  add_foreign_key "tweets", "channel_users"
  add_foreign_key "tweets", "channels"
end
