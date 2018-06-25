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

ActiveRecord::Schema.define(version: 20180619103158) do

  create_table "answerbookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answerbookmarks", ["answers_id"], name: "index_answerbookmarks_on_answers_id"
  add_index "answerbookmarks", ["user_id"], name: "index_answerbookmarks_on_user_id"

  create_table "answerdownvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answerdownvotes", ["answer_id"], name: "index_answerdownvotes_on_answer_id"
  add_index "answerdownvotes", ["user_id"], name: "index_answerdownvotes_on_user_id"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
    t.integer  "message_id"
    t.string   "comments"
  end

  add_index "answers", ["message_id"], name: "index_answers_on_message_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "commentdownvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "messagecomment_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "commentdownvotes", ["messagecomment_id"], name: "index_commentdownvotes_on_messagecomment_id"
  add_index "commentdownvotes", ["user_id"], name: "index_commentdownvotes_on_user_id"

  create_table "commentupvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "messagecomment_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "commentupvotes", ["messagecomment_id"], name: "index_commentupvotes_on_messagecomment_id"
  add_index "commentupvotes", ["user_id"], name: "index_commentupvotes_on_user_id"

  create_table "follow_mappings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "message_follows", force: :cascade do |t|
    t.integer  "message_follower_id"
    t.integer  "message_followee_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "message_upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "message_upvotes", ["message_id"], name: "index_message_upvotes_on_message_id"
  add_index "message_upvotes", ["user_id"], name: "index_message_upvotes_on_user_id"

  create_table "messagecomments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "message_id"
    t.string   "content"
    t.integer  "user_id"
  end

  add_index "messagecomments", ["message_id"], name: "index_messagecomments_on_message_id"
  add_index "messagecomments", ["user_id"], name: "index_messagecomments_on_user_id"

  create_table "messagedownvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messagedownvotes", ["message_id"], name: "index_messagedownvotes_on_message_id"
  add_index "messagedownvotes", ["user_id"], name: "index_messagedownvotes_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "upvotes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "answer_id"
    t.integer  "user_id"
  end

  add_index "upvotes", ["answer_id"], name: "index_upvotes_on_answer_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_picture"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "name"
    t.string   "image"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "birthday"
    t.string   "ProfileCredential"
    t.string   "Description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
